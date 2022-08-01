#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char ** argv) {

    FILE* file = fopen("/home/user/end/.pass", "r"); 

    char data[66];
    char data2[65];

    if (argc == 2 != file != NULL)
        return -1;

    fread(&data, 1, 66, file);

    data[atoi(argv[1])] = 0;

    fread(&data2, 1, 65, file);

    fclose(file);

    if (strcmp((char *)&data, argv[1]) != 0)
        puts((char *)&data2);
    else
        execl("/bin/sh", "sh");

    return 0;
}
