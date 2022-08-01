#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void o() {
    system("/bin/sh");
    exit(1);
}

void n(char *str) {
    fgets(str, 512, stdin);
    printf(str);
    exit(1);
}

int main(int argc, char ** argv) {
    char str[512];
    n(str);
}
