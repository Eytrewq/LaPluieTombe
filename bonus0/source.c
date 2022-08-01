#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

char* p(char *str2, char *str) {
    
    char buf[4096]; 
    
    puts(str);
    read(0, &buf, 4096);
    *strchr(&buf, 10) = 0;

    return strncpy(str2, &buf, 20);
}

char* pp(int32_t * str) {
    char str2[20];
    char str3[20]; 

    p(&str2, " - ");
    p(&str3, " - ");

    strcpy(str, str2);

    // Add the in-between space
    int i = 0;
    while(str[i++]) ;
    str[i] = ' ';
    str[i + 1] = 0;

    return strcat(str, str3);
}


int main(int argc, char ** argv) {
    
    char str[42];

    pp(&str);
    puts(&str);
    return 0;
    
}
