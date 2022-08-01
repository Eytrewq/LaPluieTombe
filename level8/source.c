#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *auth = NULL;
char *service = NULL;

int main(int argc, char ** argv) {
    
    char str[128]; 
    
    while (1)
    {
        printf("%p, %p \n", auth, service);
        if (fgets(str, 128, stdin) == NULL)
            return (0);
        if (strncmp(str, "auth ", 5) == 0)
        {
            auth = malloc(4);
            *auth = 0;
            strcpy(auth, str);
        }
        if (strncmp(str, "reset", 5) == 0)
            free(auth);
        if (strncmp(str, "service", 7) == 0)
            service = strdup(str);
        if (strncmp(str, "login", 5) == 0)
        {
            if (*auth + 32 == 0)
                fwrite("Password:\n", 1, 10, stdout);
            else
                system("/bin/sh");
        }
    }
    return (0);
}
