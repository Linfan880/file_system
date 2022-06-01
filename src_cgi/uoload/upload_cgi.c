#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/wait.h>
#include "thirdparty/mysql/mysql.h"
#include "disk/fcgi_stdio.h"
#include "disk/make_log.h" //日志头文件
#include "disk/cfg.h"
#include "disk/util_cgi.h" //cgi后台通用接口，trim_space(), memstr()

#define UPLOAD_LOG_MODULE "cgi"
#define UPLOAD_LOG_PROC   "upload"
#define SQL_MAX_LEN         (512)   //sql语句长度
//===2、上传文件：
//127.0.0.1:80/upload
//
//        post数据如下：
//------WebKitFormBoundary88asdgewtgewx\r\n
//        Content-Disposition: form-data; user="mike"; filename="xxx.jpg"; md5="xxxx"; size=10240\r\n
//        Content-Type: application/octet-stream\r\n
//\r\n
//        真正的文件内容\r\n
//------WebKitFormBoundary88asdgewtgewx
int recv_save_file(long len, char *user, char *filename, char *md5, long *size){
    int ret=0;
    char *file_buf = NULL;
    char *begin = NULL;
    char *p, *q, *k;

    char content_text[TEMP_BUF_MAX_LEN] = {0}; //文件头部信息
    char boundary[TEMP_BUF_MAX_LEN] = {0};     //分界线信息

    //==========> 开辟存放文件的 内存 <===========
    file_buf = (char *)malloc(len);
    if (file_buf == NULL)
    {
        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "malloc error! file size is to big!!!!\n");
        return -1;
    }

    int ret2 = fread(file_buf, 1, len, stdin); //从标准输入(web服务器)读取内容
    if(ret2 == 0)
    {
        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "fread(file_buf, 1, len, stdin) err\n");
        ret = -1;
        goto END;
    }

    //===========> 开始处理前端发送过来的post数据格式 <============
    begin = file_buf;    //内存起点
    p = begin;
    LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "file_buf is: %s\n", begin);
    /*
       ------WebKitFormBoundary88asdgewtgewx\r\n
       Content-Disposition: form-data; user="mike"; filename="xxx.jpg"; md5="xxxx"; size=10240\r\n
       Content-Type: application/octet-stream\r\n
       \r\n
       真正的文件内容\r\n
       ------WebKitFormBoundary88asdgewtgewx
       */

    //get boundary 得到分界线, ------WebKitFormBoundary88asdgewtgewx
    p = strstr(begin, "\r\n");
    if (p == NULL)
    {
        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC,"wrong no boundary!\n");
        ret = -1;
        goto END;
    }

    //拷贝分界线
    strncpy(boundary, begin, p-begin);
    boundary[p-begin] = '\0';   //字符串结束符
    LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC,"boundary: [%s]\n", boundary);

    p += 2;//\r\n
    //已经处理了p-begin的长度
    len -= (p-begin);

    //Content-Disposition: form-data; user="mike"; filename="xxx.jpg"; md5="xxxx"; size=10240\r\n
    begin = p;

    //Content-Disposition: form-data; user="mike"; filename="xxx.jpg"; md5="xxxx"; size=10240\r\n
    p = strstr(begin, "\r\n");
    if(p == NULL)
    {
        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC,"ERROR: get context text error, no filename?\n");
        ret = -1;
        goto END;
    }
    strncpy(content_text, begin, p-begin);
    content_text[p-begin] = '\0';
    LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC,"content_text: [%s]\n", content_text);

    p += 2;//\r\n
    len -= (p-begin);

    //========================================获取文件上传者
    //Content-Disposition: form-data; user="mike"; filename="xxx.jpg"; md5="xxxx"; size=10240\r\n
    //                                ↑
    q = begin;
    q = strstr(begin, "user=");

    //Content-Disposition: form-data; user="mike"; filename="xxx.jpg"; md5="xxxx"; size=10240\r\n
    //                                      ↑
    q += strlen("user=");
    q++;    //跳过第一个"

    //Content-Disposition: form-data; user="mike"; filename="xxx.jpg"; md5="xxxx"; size=10240\r\n
    //                                          ↑
    k = strchr(q, '"');
    strncpy(user, q, k-q);  //拷贝用户名
    user[k-q] = '\0';

    //去掉一个字符串两边的空白字符
    trim_space(user);   //util_cgi.h

    //========================================获取文件名字
    //"; filename="xxx.jpg"; md5="xxxx"; size=10240\r\n
    //   ↑
    begin = k;
    q = begin;
    q = strstr(begin, "filename=");

    //"; filename="xxx.jpg"; md5="xxxx"; size=10240\r\n
    //             ↑
    q += strlen("filename=");
    q++;    //跳过第一个"

    //"; filename="xxx.jpg"; md5="xxxx"; size=10240\r\n
    //                    ↑
    k = strchr(q, '"');
    strncpy(filename, q, k-q);  //拷贝文件名
    filename[k-q] = '\0';

    trim_space(filename);   //util_cgi.h

    //========================================获取文件MD5码
    //"; md5="xxxx"; size=10240\r\n
    //   ↑
    begin = k;
    q = begin;
    q = strstr(begin, "md5=");

    //"; md5="xxxx"; size=10240\r\n
    //        ↑
    q += strlen("md5=");
    q++;    //跳过第一个"

    //"; md5="xxxx"; size=10240\r\n
    //            ↑
    k = strchr(q, '"');
    strncpy(md5, q, k-q);   //拷贝文件名
    md5[k-q] = '\0';

    trim_space(md5);    //util_cgi.h

    //========================================获取文件大小
    //"; size=10240\r\n
    //   ↑
    begin = k;
    q = begin;
    q = strstr(begin, "size=");

    //"; size=10240\r\n
    //        ↑
    q += strlen("size=");

    //"; size=10240\r\n
    //             ↑
    k = strstr(q, "\r\n");
    char tmp[256] = {0};
    strncpy(tmp, q, k-q);   //内容
    tmp[k-q] = '\0';

    *size = strtol(tmp, NULL, 10); //字符串转long

    begin = p;
    p = strstr(begin, "\r\n");
    p += 4;//\r\n\r\n
    len -= (p-begin);

    //下面才是文件的真正内容

    /*
       ------WebKitFormBoundary88asdgewtgewx\r\n
       Content-Disposition: form-data; user="mike"; filename="xxx.jpg"; md5="xxxx"; size=10240\r\n
       Content-Type: application/octet-stream\r\n
       \r\n
       真正的文件内容\r\n
       ------WebKitFormBoundary88asdgewtgewx
       */

    begin = p;
    //find file's end
    p = memstr(begin, len, boundary);//util_cgi.h， 找文件结尾
    if (p == NULL)
    {
        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "memstr(begin, len, boundary) error\n");
        ret = -1;
        goto END;
    }
    else
    {
        p = p - 2;//\r\n
    }

    //begin---> file_len = (p-begin)

    //=====> 此时begin-->p两个指针的区间就是post的文件二进制数据
    //======>将数据写入文件中,其中文件名也是从post数据解析得来  <===========

    int fd;
    fd = open(filename, O_CREAT|O_WRONLY, 0644);
    if (fd < 0)
    {
        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC,"open %s error\n", filename);
        ret = -1;
        goto END;
    }

    //ftruncate会将参数fd指定的文件大小改为参数length指定的大小
    ftruncate(fd, (p-begin));
    write(fd, begin, (p-begin));
    close(fd);

END:
    free(file_buf);
    file_buf = NULL;

    return ret;
}

int upload_to_dstorage(const char *file_name, char *file_id){
    int fd[2];
    int ret=0;
    pid_t pid;
    if(pipe(fd)==-1){
        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "Create pipe Failed");
        ret=-1;
        goto END;
    }
    //创建进程
    pid = fork();
    if (pid < 0)//进程创建失败
    {
        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "fork error\n");
        ret = -1;
        goto END;
    }
    //子进程
    if(pid==0){
        close(fd[0]);
        //将标准输出 重定向 写管道
        dup2(fd[1], STDOUT_FILENO); //dup2(fd[1], 1);

        //通过execlp执行fdfs_upload_file
        execlp("fdfs_upload_file", "fdfs_upload_file", "/etc/fdfs/client.conf", file_name, NULL);

        //执行失败
        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "execlp fdfs_upload_file error\n");
        close(fd[1]);
    }else if(pid>0){    //父进程
        close(fd[1]);
        int count = read(fd[0], file_id, 1024);
        if(count<0)
        {
            LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "read file_id err\n");
            ret=-1;
            goto END;
        }
        //去掉一个字符串两边的空白字符
        trim_space(file_id);
        if (strlen(file_id) == 0)
        {
            LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC,"[upload FAILED!]\n");
            ret = -1;
            goto END;
        }

        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "get [%s] succ!\n", file_id);

        wait(NULL); //等待子进程结束，回收其资源

        close(fd[0]);
    }

END:
    return ret;
}

int make_file_url(const char *file_id, char *fdfs_file_url){
    int ret=0;
    char *p = NULL;
    char *q = NULL;
    char *k = NULL;

    char fdfs_file_stat_buf[TEMP_BUF_MAX_LEN] = {0};
    char fdfs_file_host_name[HOST_NAME_LEN] = {0};  //storage所在服务器ip地址

    pid_t pid;
    int fd[2];

    //无名管道的创建
    if (pipe(fd) < 0)
    {
        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "pip error\n");
        ret = -1;
        goto END;
    }

    //创建进程
    pid = fork();
    if (pid < 0)//进程创建失败
    {
        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC,"fork error\n");
        ret = -1;
        goto END;
    }

    if(pid == 0) //子进程
    {
        //关闭读端
        close(fd[0]);

        //将标准输出 重定向 写管道
        dup2(fd[1], STDOUT_FILENO); //dup2(fd[1], 1);

        //读取fdfs client 配置文件的路径
//        char fdfs_cli_conf_path[256] = {0};
//        get_cfg_value(CFG_PATH, "dfs_path", "client", fdfs_cli_conf_path);

        execlp("fdfs_file_info", "fdfs_file_info", "/etc/fdfs/client.conf", file_id, NULL);

        //执行失败
        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "execlp fdfs_file_info error\n");

        close(fd[1]);
    }
    else //父进程
    {
        //关闭写端
        close(fd[1]);

        //从管道中去读数据
        read(fd[0], fdfs_file_stat_buf, TEMP_BUF_MAX_LEN);
        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "get file_ip [%s] succ\n", fdfs_file_stat_buf);

        wait(NULL); //等待子进程结束，回收其资源
        close(fd[0]);
        /*
        读端的内容
        source storage id: 0
        source ip address: 192.168.28.141
        file create timestamp: 2022-05-29 20:08:16
        file size: 7592
        file crc32: 3199580455 (0xBEB5B927)
         */

        //拼接上传文件的完整url地址--->http://host_name/group1/M00/00/00/D12313123232312.png
        p = strstr(fdfs_file_stat_buf, "source ip address: ");

        q = p + strlen("source ip address: ");
        k = strstr(q, "\n");

        strncpy(fdfs_file_host_name, q, k-q);
        fdfs_file_host_name[k-q] = '\0';

        printf("host_name:[%s]\n", fdfs_file_host_name);
        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "host_name:[%s]\n", fdfs_file_host_name);

        //读取storage_web_server服务器的端口
//        char storage_web_server_port[20] = {0};
//        get_cfg_value(CFG_PATH, "storage_web_server", "port", storage_web_server_port);
        strcat(fdfs_file_url, "http://");
        strcat(fdfs_file_url, fdfs_file_host_name);
        strcat(fdfs_file_url, ":");
        strcat(fdfs_file_url, "80");
        strcat(fdfs_file_url, "/");
        strcat(fdfs_file_url, file_id);

        printf("[%s]\n", fdfs_file_url);
        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "file url is: %s\n", fdfs_file_url);
    }

END:
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
        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "mysql_query err\n");
        ret = -1;
        goto END;
    }

    res_set = mysql_store_result(conn);//生成结果集
    if (res_set == NULL)
    {
        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "mysql_store_result err\n");
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

int store_fileinfo_to_mysql(const char *user, const char *filename, const char *md5,
                            long size,
                            const char *fileid,
                            const char *fdfs_file_url)
{
    int ret=0;
    MYSQL *conn = NULL;

    time_t now;;
    char create_time[TIME_STRING_LEN];
    char suffix[SUFFIX_LEN];
    char sql_cmd[SQL_MAX_LEN] = {0};

    conn = mysql_init(NULL);
    if(conn == NULL)	//初始化句柄mysql
    {
        printf("%d : error : %s\n", __LINE__, mysql_error(conn));
        ret = -1;
        exit(1);
    }
    if (mysql_library_init(0, NULL, NULL) != 0) 	//初始化mysql数据库
    {
        fprintf(stderr, "could not initialize MySQL client library\n");
        ret = -1;
        exit(1);
    }
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
        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "msql_conn err\n");
        ret = -1;
        goto END;
    }
    if(mysql_set_character_set(conn, "utf8") != 0)	//设置中文字符集
    {
        printf("%d : error : %s\n", __LINE__, mysql_error(conn));
        ret = -1;
        exit(1);
    }
    LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "msql conn success!!!\n");


    //得到文件后缀字符串 如果非法文件后缀,返回"null"
    if(get_file_suffix(filename, suffix)!=0){   //mp4, jpg, png
        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "get_file_suffix err\n");
        ret = -1;
        goto END;
    }
    sprintf(sql_cmd, "insert into file_info (md5, file_id, url, size, type, count) values ('%s', '%s', '%s', '%ld', '%s', %d)",
            md5, fileid, fdfs_file_url, size, suffix, 1);
    if (mysql_query(conn, sql_cmd) != 0) //执行sql语句
    {
        //print_error(conn, "插入失败");
        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "%s 插入失败: %s\n", sql_cmd, mysql_error(conn));
        ret = -1;
        goto END;
    }
    LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "%s 文件信息插入成功\n", sql_cmd);

    //获取当前时间
    now = time(NULL);
    strftime(create_time, TIME_STRING_LEN-1, "%Y-%m-%d %H:%M:%S", localtime(&now));

    sprintf(sql_cmd, "insert into user_file_list(user, md5, createtime, filename, shared_status, pv) values ('%s', '%s', '%s', '%s', %d, %d)",
            user, md5, create_time, filename, 0, 0);
    if(mysql_query(conn, sql_cmd) != 0)
    {
        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "%s 操作失败: %s\n", sql_cmd, mysql_error(conn));
        ret = -1;
        goto END;
    }
    //查询用户文件数量
    sprintf(sql_cmd, "select count from user_file_count where user = '%s'", user);
    int ret2 = 0;
    char tmp[512] = {0};
    int count = 0;
    //返回值： 0成功并保存记录集，1没有记录集，2有记录集但是没有保存，-1失败
    ret2 = process_result_one(conn, sql_cmd, tmp); //执行sql语句
    if(ret2 == 1) //没有记录
    {
        //插入记录
        sprintf(sql_cmd, " insert into user_file_count (user, count) values('%s', %d)", user, 1);
    }
    else if(ret2 == 0)
    {
        //更新用户文件数量count字段
        count = atoi(tmp);
        sprintf(sql_cmd, "update user_file_count set count = %d where user = '%s'", count+1, user);
    }

    if(mysql_query(conn, sql_cmd) != 0)
    {
        LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "%s 操作失败: %s\n", sql_cmd, mysql_error(conn));
        ret = -1;
        goto END;
    }

END:
    if (conn != NULL)
    {
        mysql_close(conn); //断开数据库连接
    }

    return ret;
}

int main()
{
    char filename[FILE_NAME_LEN] = {0}; //文件名
    char user[USER_NAME_LEN] = {0};     //文件上传者
    char md5[MD5_LEN] = {0};            //文件md5码
    long size;                          //文件大小
    char fileid[TEMP_BUF_MAX_LEN] = {0};    //文件上传到fastDFS后的文件id
    char fdfs_file_url[FILE_URL_LEN] = {0}; //文件所存放storage的host_name

    while (FCGI_Accept() >= 0)
    {
        char *contentLength = getenv("CONTENT_LENGTH");
        long len;
        int ret = 0;

        printf("Content-type: text/html\r\n\r\n");

        if (contentLength != NULL)
        {
            len = strtol(contentLength, NULL, 10); //字符串转long， 或者atol
        }
        else
        {
            len = 0;
        }

        if (len <= 0){
            printf("Upload Module: No data from standard input\n");
            LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "Upload Module: len = 0, No data from standard input\n");
            ret = -1;
        }
        else{
            //===============> 得到上传文件  <============
            if (recv_save_file(len, user, filename, md5, &size) < 0)
            {
                LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "recv_save_file err\n");
                ret = -1;
                goto END;
            }
            LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "%s成功上传[%s, 大小：%ld, md5码：%s]到本地\n",
                user, filename, size, md5);

            //===============> 将该文件存入fastDFS中,并得到文件的file_id <============
            if (upload_to_dstorage(filename, fileid) < 0)
            {
                ret = -1;
                goto END;
            }

            //================> 删除本地临时存放的上传文件 <===============
            unlink(filename);

            //================> 得到文件所存放storage的host_name <=================
            if (make_file_url(fileid, fdfs_file_url) < 0)
            {
                LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "make_file_url err\n");
                ret = -1;
                goto END;
            }

            //===============> 将该文件的FastDFS相关信息存入mysql中 <======
            if (store_fileinfo_to_mysql(user, filename, md5, size, fileid, fdfs_file_url) < 0)
            {
                LOG(UPLOAD_LOG_MODULE, UPLOAD_LOG_PROC, "store_file_info_to_mysql err\n");
                ret = -1;
                goto END;
            }

        END:
            memset(filename, 0, FILE_NAME_LEN);
            memset(user, 0, USER_NAME_LEN);
            memset(md5, 0, MD5_LEN);
            memset(fileid, 0, TEMP_BUF_MAX_LEN);
            memset(fdfs_file_url, 0, FILE_URL_LEN);

            char *out = NULL;
            //给前端返回，上传情况
            /*
               上传文件：
               成功：{"code":"008"}
               失败：{"code":"009"}
               */
            if(ret == 0) //成功上传
            {
                out = return_status("008");//common.h
            }
            else//上传失败
            {
                out = return_status("009");//common.h
            }

            if(out != NULL)
            {
                printf(out); //给前端反馈信息
                free(out);   //记得释放
            }
        }
    } /* while */

    return 0;
}
