#include <stdint.h>
#include <string.h>
#include <unistd.h>

class N
{
    char annotation[100];
    int value;
    
    public:

    N(int value) : value(value) {}; // _ZN1NC1Ei

    void setAnnotation(char *str) // _ZN1N13setAnnotationEPc
    {
        int len = strlen(str);
        memcpy(annotation, str, len);
    };

    virtual int operator+(const N& operand) { return value + operand.value; }; // _ZN1NplERS_
    virtual int operator-(const N& operand) { return value - operand.value; }; // _ZN1NmiERS_
};

int main(int argc, char **argv)
{
    if (argc <= 1)
        exit(1);

    N* v1 = new N(5);
    N* v2 = new N(6);
    v1->setAnnotation(argv[1]);

    return *v1 + *v2;
}
