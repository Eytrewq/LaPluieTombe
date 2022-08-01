#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int global_var = 0;

int v(char *str)
{
    fgets(str, 512, stdin);

    printf(str);

    if (global_var == 64)
    {
        fwrite("Wait what?!\n", 1, 12, stdout);
        return system("/bin/sh");
    }

    return 0;
}

int main(int argc, char **argv)
{
    char str[512];

    return v(str);
}
