#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int run() {
    fwrite("Good... Wait what?\n", 1, 19, stdout);
    return system("/bin/sh");
}

int main(int argc, char ** argv) {
    char str[72]; 
    return gets(str);
}
