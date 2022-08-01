#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int32_t n(void)
{
    return system("/bin/cat /home/user/level7/.pass");
}

int32_t m(void)
{
    return puts("Nope");
}

int main(int argc, char **argv)
{
    char *mem = malloc(64);
    int (**mem2)() = malloc(4);

    *mem2 = m;

    strcpy(mem, argv[1]);

    return (*mem2)();
}
