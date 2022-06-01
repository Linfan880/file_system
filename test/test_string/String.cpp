//
// Created by linfan on 2022/3/30.
//

#include "String.h"
#include "iostream"
#include <cstring>
#include "string"

using namespace std;

String::String() {
    cout<<"default"<<endl;
}

//普通构造函数
String::String(const char *str)
{
    if (strlen(str) == 0)
    {
        m_data = new char[1];// 得分点：对空字符串自动申请存放结束标志'\0'的，加分点：对m_data加NULL判断
        *m_data = '\0';
    }
    else
    {
        int length = strlen(str);
        m_data = new char[length + 1];// 若能加 NULL 判断则更好
        strcpy(m_data, str);
    }
    cout << "dai can construction" << endl;
}


// String的析构函数
String::~String()
{
    delete m_data; // 或delete m_data;
    cout << "deconstruction" << endl;
}


//拷贝构造函数
String::String(const String &other)// 得分点：输入参数为const型
{
    int length = strlen(other.m_data);
    m_data = new char[length + 1];// 若能加 NULL 判断则更好
    strcpy(m_data, other.m_data);
    cout << "copy construction" << endl;
}


//赋值函数
String & String::operator = (const String &other) // 得分点：输入参数为const型
{
    if (this == &other)//得分点：检查自赋值
        return *this;
    if (m_data)
        delete[] m_data;//得分点：释放原有的内存资源
    int length = strlen(other.m_data);
    m_data = new char[length + 1];//加分点：对m_data加NULL判断
    strcpy(m_data, other.m_data);
    cout << "= construction" << endl;

    return *this;//得分点：返回本对象的引用
}