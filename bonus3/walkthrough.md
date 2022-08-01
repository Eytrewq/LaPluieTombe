Nous remarquons une comparaison entre le fread qui est potentiellement le `.pass` de end, et notre chaine de caractères.

```bash
 80485d3:	8d 44 24 18          	lea    0x18(%esp),%eax
 80485d7:	89 04 24             	mov    %eax,(%esp)
 80485da:	e8 d1 fd ff ff       	call   80483b0 <strcmp@plt>
 80485df:	85 c0                	test   %eax,%eax
 80485e1:	75 1e                	jne    8048601 <main+0x10d>
```

Nous remarquons également qu'il met un `\0` à l'endroit indiquer du atoi de notre premier argument.
Nous souhaitons mettre un `\0` au début de data, et mettre une chaine de caractères vide en premier argument,
afin que le strcmp nous laisse accéder au terminal final !

```bash
bonus3@RainFall:~$ ./bonus3 ""
$ cat /home/user/end/.pass
3321b6f81659f9a71c76616f606e4b50189cecfea611393d5d649f75e157353c
```
