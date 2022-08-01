#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char **argv)
{
    int str_as_i = atoi(argv[1]);
    int result = 1;

    if (str_as_i < 10)
    {
        char buffer[36];

        memcpy(&buffer, argv[2], 4 * str_as_i);
        result = 0;

        if (str_as_i == 0x574f4c46)
            execl("/bin/sh", "sh");
    }

    return result;
}
