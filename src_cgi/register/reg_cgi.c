#include <stdlib.h>
#include <stdio.h>
#include <sys/time.h>
#include <string.h>
#include <mysql/mysql.h>
#include "disk/make_log.h"
#include "disk/cfg.h"
#include "thirdparty/cJson/cJSON.h"
#include "disk/util_cgi.h"
#include "thirdparty/fcgi_config.h"
#include "thirdparty/fcgi_stdio.h"

#define REG_LOG_MODULE       "cgi"
#define REG_LOG_PROC         "reg"
#define SQL_MAX_LEN         (512)   //sql语句长度

void print_error(MYSQL *conn, const char *title)
{
    fprintf(stderr,"%s:\nError %u (%s)\n", title, mysql_errno(conn), mysql_error(conn));
}

//处理数据库查询结果，结果集保存在buf，只处理一条记录，一个字段, 如果buf为NULL，无需保存结果集，只做判断有没有此记录
//返回值： 0成功并保存记录集，1没有记录集，2有记录集但是没有保存，-1失败
int process_result_one(MYSQL *conn, char *sql_cmd, char *buf){
    int ret = 0;
    MYSQL_RES *res_set = NULL;  //结果集结构的指针

    if (mysql_query(conn, sql_cmd)!= 0) //执行sql语句，执行成功返回0
    {
        print_error(conn, "mysql_query error!\n");
        ret = -1;
        goto END;
    }

    res_set = mysql_store_result(conn);//生成结果集
    if (res_set == NULL)
    {
        print_error(conn, "smysql_store_result error!\n");
        ret = -1;
        goto END;
    }

    MYSQL_ROW row;
    ulong line = 0;

    //mysql_num_rows接受由mysql_store_result返回的结果结构集，并返回结构集中的行数
    line = mysql_num_rows(res_set);
    if (line == 0)
    {
        ret = 1; //1没有记录集
        goto END;
    }
    else if(line > 0 && buf == NULL) //如果buf为NULL，无需保存结果集，只做判断有没有此记录
    {
        ret = 2; //2有记录集但是没有保存
        goto END;
    }

    // mysql_fetch_row从结果结构中提取一行，并把它放到一个行结构中。当数据用完或发生错误时返回NULL.
    if (( row = mysql_fetch_row(res_set) ) != NULL)
    {
        if (row[0] != NULL)
        {
            strcpy(buf, row[0]);
        }
    }

    END:
    if(res_set != NULL)
    {
        //完成所有对数据的操作后，调用mysql_free_result来善后处理
        mysql_free_result(res_set);
    }

    return ret;
}

//解析用户注册信息的json包
int get_reg_info(const char *reg_buf, char *user, char *nick_name, char *pwd, char *tel, char *email){
    int ret = 0;
    cJSON *obj;
    obj = cJSON_Parse(reg_buf);
    if(obj==NULL)
    {
        LOG(REG_LOG_MODULE, REG_LOG_PROC, "cJSON_Parse err\n");
        ret = -1;
        goto END;
    }
    cJSON *cjs_userName = cJSON_GetObjectItem(obj, "userName");
    if(cjs_userName == NULL){
        LOG(REG_LOG_MODULE, REG_LOG_PROC, "cJSON_GetObjectItem err\n");
        ret = -1;
        goto END;
    }
    cJSON *cjs_nickName = cJSON_GetObjectItem(obj, "nickName");
    if(cjs_nickName == NULL){
        LOG(REG_LOG_MODULE, REG_LOG_PROC, "cJSON_GetObjectItem err\n");
        ret = -1;
        goto END;
    }
    cJSON *cjs_firstPwd = cJSON_GetObjectItem(obj, "firstPwd");
    if(cjs_firstPwd == NULL){
        LOG(REG_LOG_MODULE, REG_LOG_PROC, "cJSON_GetObjectItem err\n");
        ret = -1;
        goto END;
    }
    cJSON *cjs_phone = cJSON_GetObjectItem(obj, "phone");
    if(cjs_phone == NULL){
        LOG(REG_LOG_MODULE, REG_LOG_PROC, "cJSON_GetObjectItem err\n");
        ret = -1;
        goto END;
    }
    cJSON *cjs_email = cJSON_GetObjectItem(obj, "email");
    if(cjs_email == NULL){
        LOG(REG_LOG_MODULE, REG_LOG_PROC, "cJSON_GetObjectItem err\n");
        ret = -1;
        goto END;
    }
    //拷贝内容
    strcpy(user, cjs_userName->valuestring);
    strcpy(nick_name, cjs_nickName->valuestring);
    strcpy(pwd, cjs_firstPwd->valuestring);
    strcpy(tel, cjs_phone->valuestring);
    strcpy(email, cjs_email->valuestring);

END:
    if(obj != NULL)
    {
        cJSON_Delete(obj);//删除json对象
        obj = NULL;
    }

    return ret;
}

//注册用户，成功返回0，失败返回-1, 该用户已存在返回-2
int user_reg(const char *reg_buf){
    int ret = 0;
    MYSQL *conn = NULL;
    conn = mysql_init(NULL);
    if(conn == NULL)	//初始化句柄mysql
    {
        printf("%d : error : %s\n", __LINE__, mysql_error(conn));
        exit(1);
    }
    if (mysql_library_init(0, NULL, NULL) != 0) 	//初始化mysql数据库
    {
        fprintf(stderr, "could not initialize MySQL client library\n");
        exit(1);
    }
    //获取数据库用户名、用户密码、数据库标示等信息
//    char mysql_user[256] = {0};
//    char mysql_pwd[256] = {0};
//    char mysql_db[256] = {0};
//    ret = get_mysql_info(mysql_user, mysql_pwd,  mysql_db);
    //与mysql服务器建立连接
//    TODO:优化，不能写死
    if (NULL == mysql_real_connect
            (conn,
             "192.168.28.141",
             "root",
             "lin2738963",
             "cloud_disk",
             3306,
             NULL,
             0)
            )
    {
        printf("%d : error : %s\n", __LINE__, mysql_error(conn));
        LOG(REG_LOG_MODULE, REG_LOG_PROC, "msql_conn err\n");
        ret = -1;
        goto END;
    }
    if(mysql_set_character_set(conn, "utf8") != 0)	//设置中文字符集
    {
        printf("%d : error : %s\n", __LINE__, mysql_error(conn));
        exit(1);
    }
    LOG(REG_LOG_MODULE, REG_LOG_PROC, "msql conn success!!!\n");

    //获取注册用户的信息
    char user[128];
    char nick_name[128];
    char pwd[128];
    char tel[128];
    char email[128];
    ret = get_reg_info(reg_buf, user, nick_name, pwd, tel, email);
    if(ret != 0)
    {
        goto END;
    }
    LOG(REG_LOG_MODULE, REG_LOG_PROC, "user = %s, nick_name = %s, pwd = %s, tel = %s, email = %s\n",
        user, nick_name, pwd, tel, email);

    char sql_cmd[SQL_MAX_LEN] = {0};
    sprintf(sql_cmd, "select * from user where name = '%s'", user);

    //查看该用户是否存在
    int ret2 = 0;
    //返回值： 0成功并保存记录集，1没有记录集，2有记录集但是没有保存，-1失败
    ret2 = process_result_one(conn, sql_cmd, NULL); //指向sql查询语句
    if(ret2 == 2) //如果存在
    {
        LOG(REG_LOG_MODULE, REG_LOG_PROC, "【%s】该用户已存在\n");
        ret = -2;
        goto END;
    }
    //当前时间戳
    struct timeval tv;
    struct tm* ptm;
    char time_str[128];

    //使用函数gettimeofday()函数来得到时间。它的精度可以达到微妙
    gettimeofday(&tv, NULL);
    ptm = localtime(&tv.tv_sec);//把从1970-1-1零点零分到当前时间系统所偏移的秒数时间转换为本地时间
    //strftime() 函数根据区域设置格式化本地时间/日期，函数的功能将时间格式化，或者说格式化一个时间字符串
    strftime(time_str, sizeof(time_str), "%Y-%m-%d %H:%M:%S", ptm);

    //sql 语句, 插入注册信息
    sprintf(sql_cmd, "insert into user (name, nickname, password, phone, createtime, email) values ('%s', '%s', '%s', '%s', '%s', '%s')",
            user, nick_name, pwd, tel, time_str ,email);

    if(mysql_query(conn, sql_cmd) != 0)
    {
        LOG(REG_LOG_MODULE, REG_LOG_PROC, "%s 插入失败：%s\n", sql_cmd, mysql_error(conn));
        ret = -1;
        goto END;
    }


END:
    mysql_close(conn); //断开数据库连接
    mysql_library_end();

    return ret;
}

int main(){
    //阻塞等待用户连接
    while (FCGI_Accept() >= 0){
        char *contentLength = getenv("CONTENT_LENGTH");
        int len;

        printf("Content-type: text/html\r\n\r\n");

        if( contentLength == NULL )
        {
            len = 0;
        }
        else
        {
            len = atoi(contentLength); //字符串转整型
        }

        if (len <= 0)//没有登陆用户信息
        {
            printf("Register Module: No data from standard input.<p>\n");
            LOG(REG_LOG_MODULE, REG_LOG_PROC, "len = 0, No data from standard input\n");
        }
        else //获取登陆用户信息
        {
            char buf[4*1024] = {0};
            int ret = 0;
            char *out = NULL;
            ret = fread(buf, 1, len, stdin); //从标准输入(web服务器)读取内容
            if(ret == 0)
            {
                LOG(REG_LOG_MODULE, REG_LOG_PROC, "fread(buf, 1, len, stdin) err\n");
                continue;
            }

            LOG(REG_LOG_MODULE, REG_LOG_PROC, "buf = %s\n", buf);

            //注册用户，成功返回0，失败返回-1, 该用户已存在返回-2
            /*
            注册：
                成功：{"code":"002"}
                该用户已存在：{"code":"003"}
                失败：{"code":"004"}
            */
            ret = user_reg(buf);
            if (ret == 0) //注册成功
            {
                //返回前端注册情况， 002代表成功
                out = return_status("002");//util_cgi.h
            }
            else if(ret == -1)
            {
                //返回前端注册情况， 004代表失败
                out = return_status("004");//util_cgi.h
            }
            else if(ret == -2)
            {
                out = return_status("003");//util_cgi.h
            }

            if(out != NULL)
            {
                printf(out); //给前端反馈信息
                free(out); //记得释放
            }
        }
    }

    return 0;
}