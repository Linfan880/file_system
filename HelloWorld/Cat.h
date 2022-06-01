//
// Created by linfan on 2022/3/29.
//

#ifndef CLOUD_DISK_CAT_H
#define CLOUD_DISK_CAT_H
#include "Animal.h"
#include "string"
#include "iostream"

class Cat: public Animal{
private:
    virtual void Say() final;
    virtual void Tick() final;
};
#endif //CLOUD_DISK_CAT_H
