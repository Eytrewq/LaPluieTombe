#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int32_t lang = 0;

int greetuser(char *str, char *str2)
{

    if (lang == 0)
        str = "Hello ";
    else if (lang == 1)
        str = "Hyvää päivää ";
    else if (lang == 2)
        str = "Goedemiddag! ";

    strcat(&str, &str2);
    return puts(&str);
}

int main(int argc, char **argv)
{
    if (argc != 3)
        return 1;

    char str[40];
    char str2[32];

    strncpy(&str, argv[1], 40);

    strncpy(&str2, argv[2], 32);

    char *env_val = getenv("LANG");

    if (env_val == NULL)
        lang = 0;
    else if (memcmp(env_val, "fi", 2) == 0)
        lang = 1;
    else if (memcmp(env_val, "nl", 2) == 0)
        lang = 2;

    return greetuser(str, str2);
}
