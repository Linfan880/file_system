//
// Created by linfan on 2022/3/29.
//

#ifndef CLOUD_DISK_PERSON_H
#define CLOUD_DISK_PERSON_H
#include <string>
#include <iostream>

using namespace std;

class Person {
public:
    void SetAge(const int&  age);
    void SetName(const string& name);
    string GetName();
    int GetAge();

    void ShowInfo();

private:
    string _name;
    int _age;
};


#endif //CLOUD_DISK_PERSON_H
