//
// Created by linfan on 2022/3/30.
//

#ifndef CLOUD_DISK_STRING_H
#define CLOUD_DISK_STRING_H


class String {
public:
    String();
    String(const char *str);// 普通构造函数
    String(const String &other);// 拷贝构造函数
    ~String();// 析构函数
    String & operator = (const String &other);// 赋值函数
private:
    char *m_data;// 用于保存字符串
};


#endif //CLOUD_DISK_STRING_H
