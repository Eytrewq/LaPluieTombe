#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

char buffer[68];

char m(void)
{
    return printf("%s - %d\n", &buffer, time(NULL));
}

int main(int argc, char **argv)
{
    char **malloc1 = malloc(8);
    char *malloc2 = malloc(8);
    malloc1[0] = 1;
    malloc1[1] = malloc2;

    char **malloc3 = malloc(8);
    char *malloc4 = malloc(8);
    malloc3[0] = 2;
    malloc3[1] = malloc4;

    strcpy(malloc1[1], argv[1]);
    strcpy(malloc3[1], argv[2]);

    fgets(&buffer, 68, fopen("/home/user/level8/.pass", "r"));
    puts("~~");
    return 0;
}
