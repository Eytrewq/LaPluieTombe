080484a4 <o>:
 80484a4:       55                      push   ebp
 80484a5:       89 e5                   mov    ebp,esp
 80484a7:       83 ec 18                sub    esp,0x18
 80484aa:       c7 04 24 f0 85 04 08    mov    DWORD PTR [esp],0x80485f0
 80484b1:       e8 fa fe ff ff          call   80483b0 <system@plt>
 80484b6:       c7 04 24 01 00 00 00    mov    DWORD PTR [esp],0x1
 80484bd:       e8 ce fe ff ff          call   8048390 <_exit@plt>

080484c2 <n>:
 80484c2:       55                      push   ebp
 80484c3:       89 e5                   mov    ebp,esp
 80484c5:       81 ec 18 02 00 00       sub    esp,0x218
 80484cb:       a1 48 98 04 08          mov    eax,ds:0x8049848
 80484d0:       89 44 24 08             mov    DWORD PTR [esp+0x8],eax
 80484d4:       c7 44 24 04 00 02 00    mov    DWORD PTR [esp+0x4],0x200
 80484db:       00 
 80484dc:       8d 85 f8 fd ff ff       lea    eax,[ebp-0x208]
 80484e2:       89 04 24                mov    DWORD PTR [esp],eax
 80484e5:       e8 b6 fe ff ff          call   80483a0 <fgets@plt>
 80484ea:       8d 85 f8 fd ff ff       lea    eax,[ebp-0x208]
 80484f0:       89 04 24                mov    DWORD PTR [esp],eax
 80484f3:       e8 88 fe ff ff          call   8048380 <printf@plt>
 80484f8:       c7 04 24 01 00 00 00    mov    DWORD PTR [esp],0x1
 80484ff:       e8 cc fe ff ff          call   80483d0 <exit@plt>

08048504 <main>:
 8048504:       55                      push   ebp
 8048505:       89 e5                   mov    ebp,esp
 8048507:       83 e4 f0                and    esp,0xfffffff0
 804850a:       e8 b3 ff ff ff          call   80484c2 <n>
 804850f:       c9                      leave  
 8048510:       c3                      ret    