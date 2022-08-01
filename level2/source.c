#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <stdint.h>

int p(char *str)
{
    fflush(stdin);
    gets(str);

    if (((uint32_t)str & 0xb0000000) != 0xb0000000) // S'assure que l'adresse ne soit pas sur la stack
    { 
        puts(str);
        return strdup(str);
    }

    printf("(%p)\n", str);
    exit(1);
    return 0;
}

int main(int argc, char **argv)
{
    char str[76];
    return p(str);
}
