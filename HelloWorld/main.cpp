//
// Created by linfan on 2022/3/29.
//

#include "string"
#include "iostream"
#include "Person.h"
#include "Cat.h"
#include "Dog.h"
#include "Animal.h"
#include "stdlib.h"

using namespace std;

int main(){
//    Person *p = new Person;
//    p->SetName("linfan");
//    p->SetAge(18);
//    p->ShowInfo();

    Animal *a;
    Cat *c = new Cat;
    a = c;
    a->Tick();
    a->Say();
    Dog *d = new Dog;
    a = d;
    a->Say();
    a->Tick();
    free(a);

}