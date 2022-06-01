//
// Created by linfan on 2022/3/29.
//

#include "Person.h"

int Person::GetAge() {
    return this->_age;
}

string Person::GetName() {
    return this->_name;
}

void Person::SetAge(const int &age) {
    this->_age = age;
}

void Person::SetName(const string &name) {
    this->_name = name;
}

void Person::ShowInfo() {
    cout<<"my name is: "<<Person::GetName() <<" my age is: "<<Person::GetAge()<<endl;
}