080484a4 <v>:
 80484a4:       55                      push   ebp
 80484a5:       89 e5                   mov    ebp,esp
 80484a7:       81 ec 18 02 00 00       sub    esp,0x218
 80484ad:       a1 60 98 04 08          mov    eax,ds:0x8049860
 80484b2:       89 44 24 08             mov    DWORD PTR [esp+0x8],eax
 80484b6:       c7 44 24 04 00 02 00    mov    DWORD PTR [esp+0x4],0x200
 80484bd:       00 
 80484be:       8d 85 f8 fd ff ff       lea    eax,[ebp-0x208]
 80484c4:       89 04 24                mov    DWORD PTR [esp],eax
 80484c7:       e8 d4 fe ff ff          call   80483a0 <fgets@plt>
 80484cc:       8d 85 f8 fd ff ff       lea    eax,[ebp-0x208]
 80484d2:       89 04 24                mov    DWORD PTR [esp],eax
 80484d5:       e8 b6 fe ff ff          call   8048390 <printf@plt>
 80484da:       a1 8c 98 04 08          mov    eax,ds:0x804988c
 80484df:       83 f8 40                cmp    eax,0x40
 80484e2:       75 34                   jne    8048518 <v+0x74>
 80484e4:       a1 80 98 04 08          mov    eax,ds:0x8049880
 80484e9:       89 c2                   mov    edx,eax
 80484eb:       b8 00 86 04 08          mov    eax,0x8048600
 80484f0:       89 54 24 0c             mov    DWORD PTR [esp+0xc],edx
 80484f4:       c7 44 24 08 0c 00 00    mov    DWORD PTR [esp+0x8],0xc
 80484fb:       00 
 80484fc:       c7 44 24 04 01 00 00    mov    DWORD PTR [esp+0x4],0x1
 8048503:       00 
 8048504:       89 04 24                mov    DWORD PTR [esp],eax
 8048507:       e8 a4 fe ff ff          call   80483b0 <fwrite@plt>
 804850c:       c7 04 24 0d 86 04 08    mov    DWORD PTR [esp],0x804860d
 8048513:       e8 a8 fe ff ff          call   80483c0 <system@plt>
 8048518:       c9                      leave  
 8048519:       c3                      ret    

0804851a <main>:
 804851a:       55                      push   ebp
 804851b:       89 e5                   mov    ebp,esp
 804851d:       83 e4 f0                and    esp,0xfffffff0
 8048520:       e8 7f ff ff ff          call   80484a4 <v>
 8048525:       c9                      leave  
 8048526:       c3                      ret  