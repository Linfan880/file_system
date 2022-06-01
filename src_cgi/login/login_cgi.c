#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "thirdparty/mysql/mysql.h"
#include "thirdparty/fcgi_config.h"
#include "thirdparty/fcgi_stdio.h"
#include "thirdparty/cJson//cJSON.h"
#include "disk/make_log.h" //日志头文件
#include "disk/util_cgi.h"
#include "disk/redis_op.h"
#include "disk/cfg.h"

#include "disk/des.h"    //加密
#include "disk/base64.h" //base64
#include "disk/md5.h"    //md5

#define LOGIN_LOG_MODULE "cgi"
#define LOGIN_LOG_PROC   "login"
#define SQL_MAX_LEN         (512)   //sql语句长度

int get_login_info(const char *login_buf, char *userName, char *passwd){
    int ret=0;
    cJSON *root = cJSON_Parse(login_buf);
    if(root == NULL)
    {
        LOG(LOGIN_LOG_MODULE, LOGIN_LOG_PROC, "cJSON_Parse err\n");
        ret = -1;
        goto END;
    }
    cJSON *user = cJSON_GetObjectItem(root, "user");
    if(user == NULL) {
        LOG(LOGIN_LOG_MODULE, LOGIN_LOG_PROC, "cJSON_GetObjectItem err\n");
        ret = -1;
        goto END;
    }
    cJSON *pwd = cJSON_GetObjectItem(root, "pwd");
    if(pwd == NULL) {
        LOG(LOGIN_LOG_MODULE, LOGIN_LOG_PROC, "cJSON_GetObjectItem err\n");
        ret = -1;
        goto END;
    }
    strcpy(userName, user->valuestring);
    strcpy(passwd, pwd->valuestring);

END:
    if(root!=NULL)
    {
        cJSON_Delete(root);
        root=NULL;
    }

    return ret;
}

// 处理数据库查询结果，结果集保存在buf，只处理一条记录，一个字段,
// 如果buf为NULL，无需保存结果集，只做判断有没有此记录
// 返回值： 0成功并保存记录集，1没有记录集，2有记录集但是没有保存，-1失败
int process_result_one(MYSQL *conn, const char *sql_cmd, char *buf)
{
    int ret = 0;
    MYSQL_RES *res_set = NULL;  //结果集结构的指针

    if (mysql_query(conn, sql_cmd) != 0) //执行sql语句，执行成功返回0
    {
        LOG(LOGIN_LOG_MODULE, LOGIN_LOG_PROC, "mysql_query err\n");
        ret = -1;
        goto END;
    }

    res_set = mysql_store_result(conn);//生成结果集
    if (res_set == NULL)
    {
        LOG(LOGIN_LOG_MODULE, LOGIN_LOG_PROC, "mysql_store_result err\n");
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

int check_user_pwd(const char *userName, const char *pwd){
    int ret=0;
    char sql_cmd[SQL_MAX_LEN] = {0};
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
//    TODO:login数据库连接模块优化，不能写死
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
        LOG(LOGIN_LOG_MODULE, LOGIN_LOG_PROC, "msql_conn err\n");
        ret = -1;
        goto END;
    }
    if(mysql_set_character_set(conn, "utf8") != 0)	//设置中文字符集
    {
        printf("%d : error : %s\n", __LINE__, mysql_error(conn));
        exit(1);
    }
    LOG(LOGIN_LOG_MODULE, LOGIN_LOG_PROC, "msql conn success!!!\n");

    sprintf(sql_cmd, "select password from user where name=\"%s\"", userName);
    char tmp[PWD_LEN] = {0};

    //返回值： 0成功并保存记录集，1没有记录集，2有记录集但是没有保存，-1失败
    process_result_one(conn, sql_cmd, tmp); //执行sql语句，结果集保存在tmp
    if(strcmp(tmp, pwd) == 0)
    {
        ret = 0;
        LOG(LOGIN_LOG_MODULE, LOGIN_LOG_PROC, "User Password Check Success!!!\n");
    }
    else
    {
        ret = -1;
        LOG(LOGIN_LOG_MODULE, LOGIN_LOG_PROC, "User Password Check Failed!!!\n");
    }

END:
    mysql_close(conn); //断开数据库连接
    mysql_library_end();

    return ret;
}

/**
 * @brief  生成token字符串, 保存redis数据库
 *
 * @param user 		用户名
 * @param token     生成的token字符串
 *
 * @returns
 *      成功: 0
 *      失败：-1
 */
/* -------------------------------------------*/
int set_token(const char *user, char *token)
{
    int ret = 0;
    redisContext * redis_conn = NULL;

    //redis 服务器ip、端口
    char redis_ip[30] = {0};
    char redis_port[10] = {0};

    //读取redis配置信息
//    get_cfg_value(CFG_PATH, "redis", "ip", redis_ip);
//    get_cfg_value(CFG_PATH, "redis", "port", redis_port);
//    LOG(LOGIN_LOG_MODULE, LOGIN_LOG_PROC, "redis:[ip=%s,port=%s]\n", redis_ip, redis_port);

//    #TODO:redis连接写死了，记得改
    //连接redis数据库
    redis_conn = rop_connectdb_nopwd("192.168.28.141", "6379");
    if (redis_conn == NULL)
    {
        LOG(LOGIN_LOG_MODULE, LOGIN_LOG_PROC, "redis connected error\n");
        ret = -1;
        goto END;
    }

    //产生4个1000以内的随机数
    int rand_num[4] = {0};
    int i = 0;

    //设置随机种子
    srand((unsigned int)time(NULL));
    for(i = 0; i < 4; ++i)
    {
        rand_num[i] = rand()%1000;//随机数
    }

    char tmp[1024] = {0};
    sprintf(tmp, "%s%d%d%d%d", user, rand_num[0], rand_num[1], rand_num[2], rand_num[3]);
    LOG(LOGIN_LOG_MODULE, LOGIN_LOG_PROC, "random number in tmp = %s\n", tmp);

    //加密
    char enc_tmp[1024*2] = {0};
    int enc_len = 0;
    ret = DesEnc((unsigned char *)tmp, strlen(tmp), (unsigned char *)enc_tmp, &enc_len);
    if(ret != 0)
    {
        LOG(LOGIN_LOG_MODULE, LOGIN_LOG_PROC, "DesEnc error\n");
        ret = -1;
        goto END;
    }

    //to base64
    char base64[1024*3] = {0};
    base64_encode((const unsigned char *)enc_tmp, enc_len, base64); //base64编码
    LOG(LOGIN_LOG_MODULE, LOGIN_LOG_PROC, "base64 = %s\n", base64);

    //to md5
    MD5_CTX md5;
    MD5Init(&md5);
    unsigned char decrypt[16];
    MD5Update(&md5, (unsigned char *)base64, strlen(base64) );
    MD5Final(&md5, decrypt);

    char str[100] = { 0 };
    for (i = 0; i < 16; i++)
    {
        sprintf(str, "%02x", decrypt[i]);
        strcat(token, str);
    }

    // redis保存此字符串，用户名：token, 有效时间为24小时
    ret = rop_setex_string(redis_conn, user, 86400, token);
    //ret = rop_setex_string(redis_conn, user, 30, token); //30秒


END:
    if(redis_conn != NULL)
    {
        rop_disconnect(redis_conn);
    }

    return ret;

}

//返回前端情况
void return_login_status(const char *status_num, const char *token)
{
    char *out = NULL;
    cJSON *root = cJSON_CreateObject();  //创建json项目
    cJSON_AddStringToObject(root, "code", status_num);  // {"code":"000"}
    cJSON_AddStringToObject(root, "token", token);      // {"token":"token"}
    out = cJSON_Print(root);  //cJSON to string(char *)

    cJSON_Delete(root);

    if(out != NULL)
    {
        printf(out); //给前端反馈信息
        free(out); //记得释放
    }
}

int main(){
    while(FCGI_Accept() >= 0){
        char *contentLength = getenv("CONTENT_LENGTH");
        int len;
        char token[128] = {0};
        printf("Content-type: text/html\r\n\r\n");
        if( contentLength == NULL ){
            len = 0;
        }else{
            len = atoi(contentLength); //字符串转整型
        }
        if (len <= 0)//没有登陆用户信息
        {
            printf("Login Module: No data from standard input.<p>\n");
            LOG(LOGIN_LOG_MODULE, LOGIN_LOG_PROC, "Login Module: len = 0, No data from standard input\n");
        }else //获取登陆用户信息
        {
            char buf[4*1024] = {0};
            int ret = 0;
            ret = fread(buf, 1, len, stdin); //从标准输入(web服务器)读取内容
            if(ret == 0)
            {
                LOG(LOGIN_LOG_MODULE, LOGIN_LOG_PROC, "fread(buf, 1, len, stdin) err\n");
                continue;
            }
            LOG(LOGIN_LOG_MODULE, LOGIN_LOG_PROC, "buf = %s\n", buf);

            //获取登陆用户的信息
            char user[512] = {0};
            char pwd[512] = {0};
            //得到用户名和密码
            get_login_info(buf, user, pwd);
            LOG(LOGIN_LOG_MODULE, LOGIN_LOG_PROC, "user = %s, pwd = %s\n", user, pwd);
            //登陆判断，成功返回0，失败返回-1
            ret = check_user_pwd(user, pwd);
            if (ret == 0) //登陆成功
            {
                //生成token字符串
                memset(token, 0, sizeof(token));
                ret = set_token(user, token);
                LOG(LOGIN_LOG_MODULE, LOGIN_LOG_PROC, "token = %s\n", token);
            }
            if(ret == 0)
            {
                //返回前端登陆情况， 000代表成功
                return_login_status("000", token);
            }
            else
            {
                //返回前端登陆情况， 001代表失败
                return_login_status("001", "fail");
            }
        }
    }

    return 0;
}