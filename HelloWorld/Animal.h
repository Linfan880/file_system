//
// Created by linfan on 2022/3/29.
//

#ifndef CLOUD_DISK_ANIMAL_H
#define CLOUD_DISK_ANIMAL_H
#include "string"
#include "iostream"

using namespace std;

class Animal {
public:
    virtual void Say() = 0;
    virtual void Tick() = 0;

    string _name;
    int age;
};


#endif //CLOUD_DISK_ANIMAL_H
