#include <stdio.h>
#include "mysql/mysql.h"
#include "stdlib.h"

int main(){
    MYSQL *mysql = NULL;
    mysql = mysql_init(NULL);
    if(mysql == NULL)	//初始化句柄mysql
    {
        printf("%d : error : %s\n", __LINE__, mysql_error(mysql));
        exit(1);
    }
    if (mysql_library_init(0, NULL, NULL) != 0) 	//初始化mysql数据库
    {
        printf("could not initialize MySQL client library\n");
        exit(1);
    }
    //与mysql服务器建立连接
    if (NULL == mysql_real_connect
            (mysql,
             "192.168.28.141",
             "root",
             "lin2738963",
             "cloud_disk",
             3306,
             NULL,
             0)
            )
    {
        printf("%d : error : %s\n", __LINE__, mysql_error(mysql));
        exit(1);
    }
    if(mysql_set_character_set(mysql, "utf8") != 0)	//设置中文字符集
    {
        printf("%d : error : %s\n", __LINE__, mysql_error(mysql));
        exit(1);
    }

    printf("connect success!\n");

    //
    //中间部分为程序的主题部分
    //
    mysql_close(mysql);
    mysql_library_end();

    return 0;
}