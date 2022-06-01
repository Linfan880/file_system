#include "cJson/cJSON.h"
#include <stdio.h>

int main(){
    cJSON *json = NULL;
    //创建一个jsonobj
    json = cJSON_CreateObject();

/* cjson.h中的函数原型
    CJSON_PUBLIC(cJSON*) cJSON_AddNullToObject(cJSON * const object, const char * const name);
    CJSON_PUBLIC(cJSON*) cJSON_AddTrueToObject(cJSON * const object, const char * const name);
    CJSON_PUBLIC(cJSON*) cJSON_AddFalseToObject(cJSON * const object, const char * const name);
    CJSON_PUBLIC(cJSON*) cJSON_AddBoolToObject(cJSON * const object, const char * const name, const cJSON_bool boolean);
    CJSON_PUBLIC(cJSON*) cJSON_AddNumberToObject(cJSON * const object, const char * const name, const double number);
    CJSON_PUBLIC(cJSON*) cJSON_AddStringToObject(cJSON * const object, const char * const name, const char * const string);
    CJSON_PUBLIC(cJSON*) cJSON_AddRawToObject(cJSON * const object, const char * const name, const char * const raw);
    CJSON_PUBLIC(cJSON*) cJSON_AddObjectToObject(cJSON * const object, const char * const name);
    CJSON_PUBLIC(cJSON*) cJSON_AddArrayToObject(cJSON * const object, const char * const name);
*/
    //常规的
    cJSON_AddStringToObject(json, "name", "汤圆");
    cJSON_AddNumberToObject(json, "age", 20);
#define true 1
    cJSON_AddBoolToObject(json, "isCute", true);

    //数组类的
    int numA[] = {1,2,3,4,5,6,7};
    cJSON_AddItemToObject(json,"numArr", cJSON_CreateIntArray(numA,7));
    char *strArr[] = {"hello","world"};
    cJSON_AddItemToObject(json,"strArr", cJSON_CreateStringArray(strArr,2));

    //对象
    cJSON * infojson = NULL;
    infojson = cJSON_CreateObject();
    cJSON_AddStringToObject(infojson, "phone", "1333333333");
    cJSON_AddStringToObject(infojson, "qq", "66666666");
    cJSON_AddNumberToObject(infojson, "registerTime", 1666448494);
    cJSON_AddItemToObject(json,"info", infojson);

    char *out = cJSON_Print(json);
    printf("%s\n",out);
    cJSON_Delete(json);

    printf("\n\n ------------parse json------------\n\n");


    //////////////////////////////------解析json-------//////////////////////////////
    char * in = "{\"name\":\"汤圆\",\"age\":20,\"isCute\":true,\"numArr\":[1,2,3,4,5,6,7],\"strArr\":[\"hello\",\"world\"],\"info\":{\"phone\":\"1333333333\",\"qq\":\"66666666\",\"registerTime\":1666448494}}";

    cJSON * root = cJSON_Parse(in);

    printf("name:%s\n",cJSON_GetObjectItem(root,"name")->valuestring);
    printf("age:%d\n",cJSON_GetObjectItem(root,"age")->valueint);
    printf("isCure:%d\n",cJSON_GetObjectItem(root,"isCute")->valueint);

    //数组
    cJSON *numArr = cJSON_GetObjectItem(root,"numArr");
    int numArrsize = cJSON_GetArraySize(numArr);
    int i;
    for(i = 0;i<numArrsize; i++)
    {
        printf("numArr[%d]:%d\n",i,cJSON_GetArrayItem(numArr,i)->valueint);
    }

    cJSON *strArr_parse = cJSON_GetObjectItem(root,"strArr");
    int strArrsize = cJSON_GetArraySize(strArr_parse);
    for(i = 0;i<strArrsize; i++)
    {
        printf("strArr[%d]:%s\n", i, cJSON_GetArrayItem(strArr_parse,i)->valuestring);
    }

    //obj
    cJSON * info =  cJSON_GetObjectItem(root,"info");
    printf("phone:%s\n",cJSON_GetObjectItem(info,"phone")->valuestring);
    printf("qq:%s\n",cJSON_GetObjectItem(info,"qq")->valuestring);
    printf("registerTime:%d\n",cJSON_GetObjectItem(info,"registerTime")->valueint);


    //printf(":%\n",);

    return 0;
}