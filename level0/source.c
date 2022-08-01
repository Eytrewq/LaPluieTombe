#define _GNU_SOURCE
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

int main(int argc, char **argv)
{
    gid_t gid;
    uid_t uid;
    char *cmd[2];

    if (atoi(argv[1]) != 423)
    {
        fwrite("No !\n", 5, 1, stderr);
        return (0);
    }

    cmd[0] = strdup("/bin/sh");
    cmd[1] = NULL;
    
    gid = getegid();
    uid = geteuid();

    setresgid(gid, gid, gid);
    setresuid(uid, uid, uid);

    execv("/bin/sh", cmd);
    return (0);
}
