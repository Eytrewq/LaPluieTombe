#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int global_var = 0;

int p(char *str)
{
    return printf(str);
}

int n(char *str)
{
    fgets(str, 512, stdin);
    p(str);

    if (global_var == 0x1025544)
        return system("/bin/cat /home/user/level5/.pass");

    return 0;
}

int main(int argc, char **argv)
{
    char str[512];

    return n(str);
}
