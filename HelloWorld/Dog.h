//
// Created by linfan on 2022/3/29.
//

#ifndef CLOUD_DISK_DOG_H
#define CLOUD_DISK_DOG_H
#include "Animal.h"
#include "string"
#include "iostream"

using namespace std;

class Dog : public Animal{
private:
    virtual void Say() final;
    virtual void Tick() final;

    string _name;
    int _age;
};


#endif //CLOUD_DISK_DOG_H
