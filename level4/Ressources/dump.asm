08048444 <p>:
 8048444:       55                      push   ebp
 8048445:       89 e5                   mov    ebp,esp
 8048447:       83 ec 18                sub    esp,0x18
 804844a:       8b 45 08                mov    eax,DWORD PTR [ebp+0x8]
 804844d:       89 04 24                mov    DWORD PTR [esp],eax
 8048450:       e8 eb fe ff ff          call   8048340 <printf@plt>
 8048455:       c9                      leave  
 8048456:       c3                      ret    

08048457 <n>:
 8048457:       55                      push   ebp
 8048458:       89 e5                   mov    ebp,esp
 804845a:       81 ec 18 02 00 00       sub    esp,0x218
 8048460:       a1 04 98 04 08          mov    eax,ds:0x8049804
 8048465:       89 44 24 08             mov    DWORD PTR [esp+0x8],eax
 8048469:       c7 44 24 04 00 02 00    mov    DWORD PTR [esp+0x4],0x200
 8048470:       00 
 8048471:       8d 85 f8 fd ff ff       lea    eax,[ebp-0x208]
 8048477:       89 04 24                mov    DWORD PTR [esp],eax
 804847a:       e8 d1 fe ff ff          call   8048350 <fgets@plt>
 804847f:       8d 85 f8 fd ff ff       lea    eax,[ebp-0x208]
 8048485:       89 04 24                mov    DWORD PTR [esp],eax
 8048488:       e8 b7 ff ff ff          call   8048444 <p>
 804848d:       a1 10 98 04 08          mov    eax,ds:0x8049810
 8048492:       3d 44 55 02 01          cmp    eax,0x1025544
 8048497:       75 0c                   jne    80484a5 <n+0x4e>
 8048499:       c7 04 24 90 85 04 08    mov    DWORD PTR [esp],0x8048590
 80484a0:       e8 bb fe ff ff          call   8048360 <system@plt>
 80484a5:       c9                      leave  
 80484a6:       c3                      ret    

080484a7 <main>:
 80484a7:       55                      push   ebp
 80484a8:       89 e5                   mov    ebp,esp
 80484aa:       83 e4 f0                and    esp,0xfffffff0
 80484ad:       e8 a5 ff ff ff          call   8048457 <n>
 80484b2:       c9                      leave  
 80484b3:       c3                      ret    