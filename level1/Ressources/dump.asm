08048444 <run>:
 8048444:       55                      push   ebp
 8048445:       89 e5                   mov    ebp,esp
 8048447:       83 ec 18                sub    esp,0x18
 804844a:       a1 c0 97 04 08          mov    eax,ds:0x80497c0
 804844f:       89 c2                   mov    edx,eax
 8048451:       b8 70 85 04 08          mov    eax,0x8048570
 8048456:       89 54 24 0c             mov    DWORD PTR [esp+0xc],edx
 804845a:       c7 44 24 08 13 00 00    mov    DWORD PTR [esp+0x8],0x13
 8048461:       00 
 8048462:       c7 44 24 04 01 00 00    mov    DWORD PTR [esp+0x4],0x1
 8048469:       00 
 804846a:       89 04 24                mov    DWORD PTR [esp],eax
 804846d:       e8 de fe ff ff          call   8048350 <fwrite@plt>
 8048472:       c7 04 24 84 85 04 08    mov    DWORD PTR [esp],0x8048584
 8048479:       e8 e2 fe ff ff          call   8048360 <system@plt>
 804847e:       c9                      leave  
 804847f:       c3                      ret    

08048480 <main>:
 8048480:       55                      push   ebp
 8048481:       89 e5                   mov    ebp,esp
 8048483:       83 e4 f0                and    esp,0xfffffff0
 8048486:       83 ec 50                sub    esp,0x50
 8048489:       8d 44 24 10             lea    eax,[esp+0x10]
 804848d:       89 04 24                mov    DWORD PTR [esp],eax
 8048490:       e8 ab fe ff ff          call   8048340 <gets@plt>
 8048495:       c9                      leave  
 8048496:       c3                      ret    