080484f4 <m>:
 80484f4:       55                      push   ebp
 80484f5:       89 e5                   mov    ebp,esp
 80484f7:       83 ec 18                sub    esp,0x18
 80484fa:       c7 04 24 00 00 00 00    mov    DWORD PTR [esp],0x0
 8048501:       e8 ca fe ff ff          call   80483d0 <time@plt>
 8048506:       ba e0 86 04 08          mov    edx,0x80486e0
 804850b:       89 44 24 08             mov    DWORD PTR [esp+0x8],eax
 804850f:       c7 44 24 04 60 99 04    mov    DWORD PTR [esp+0x4],0x8049960
 8048516:       08 
 8048517:       89 14 24                mov    DWORD PTR [esp],edx
 804851a:       e8 91 fe ff ff          call   80483b0 <printf@plt>
 804851f:       c9                      leave
 8048520:       c3                      ret

08048521 <main>:
 8048521:       55                      push   ebp
 8048522:       89 e5                   mov    ebp,esp
 8048524:       83 e4 f0                and    esp,0xfffffff0
 8048527:       83 ec 20                sub    esp,0x20
 804852a:       c7 04 24 08 00 00 00    mov    DWORD PTR [esp],0x8
 8048531:       e8 ba fe ff ff          call   80483f0 <malloc@plt>
 8048536:       89 44 24 1c             mov    DWORD PTR [esp+0x1c],eax
 804853a:       8b 44 24 1c             mov    eax,DWORD PTR [esp+0x1c]
 804853e:       c7 00 01 00 00 00       mov    DWORD PTR [eax],0x1
 8048544:       c7 04 24 08 00 00 00    mov    DWORD PTR [esp],0x8
 804854b:       e8 a0 fe ff ff          call   80483f0 <malloc@plt>
 8048550:       89 c2                   mov    edx,eax
 8048552:       8b 44 24 1c             mov    eax,DWORD PTR [esp+0x1c]
 8048556:       89 50 04                mov    DWORD PTR [eax+0x4],edx
 8048559:       c7 04 24 08 00 00 00    mov    DWORD PTR [esp],0x8
 8048560:       e8 8b fe ff ff          call   80483f0 <malloc@plt>
 8048565:       89 44 24 18             mov    DWORD PTR [esp+0x18],eax
 8048569:       8b 44 24 18             mov    eax,DWORD PTR [esp+0x18]
 804856d:       c7 00 02 00 00 00       mov    DWORD PTR [eax],0x2
 8048573:       c7 04 24 08 00 00 00    mov    DWORD PTR [esp],0x8
 804857a:       e8 71 fe ff ff          call   80483f0 <malloc@plt>
 804857f:       89 c2                   mov    edx,eax
 8048581:       8b 44 24 18             mov    eax,DWORD PTR [esp+0x18]
 8048585:       89 50 04                mov    DWORD PTR [eax+0x4],edx
 8048588:       8b 45 0c                mov    eax,DWORD PTR [ebp+0xc]
 804858b:       83 c0 04                add    eax,0x4
 804858e:       8b 00                   mov    eax,DWORD PTR [eax]
 8048590:       89 c2                   mov    edx,eax
 8048592:       8b 44 24 1c             mov    eax,DWORD PTR [esp+0x1c]
 8048596:       8b 40 04                mov    eax,DWORD PTR [eax+0x4]
 8048599:       89 54 24 04             mov    DWORD PTR [esp+0x4],edx
 804859d:       89 04 24                mov    DWORD PTR [esp],eax
 80485a0:       e8 3b fe ff ff          call   80483e0 <strcpy@plt>
 80485a5:       8b 45 0c                mov    eax,DWORD PTR [ebp+0xc]
 80485a8:       83 c0 08                add    eax,0x8
 80485ab:       8b 00                   mov    eax,DWORD PTR [eax]
 80485ad:       89 c2                   mov    edx,eax
 80485af:       8b 44 24 18             mov    eax,DWORD PTR [esp+0x18]
 80485b3:       8b 40 04                mov    eax,DWORD PTR [eax+0x4]
 80485b6:       89 54 24 04             mov    DWORD PTR [esp+0x4],edx
 80485ba:       89 04 24                mov    DWORD PTR [esp],eax
 80485bd:       e8 1e fe ff ff          call   80483e0 <strcpy@plt>
 80485c2:       ba e9 86 04 08          mov    edx,0x80486e9
 80485c7:       b8 eb 86 04 08          mov    eax,0x80486eb
 80485cc:       89 54 24 04             mov    DWORD PTR [esp+0x4],edx
 80485d0:       89 04 24                mov    DWORD PTR [esp],eax
 80485d3:       e8 58 fe ff ff          call   8048430 <fopen@plt>
 80485d8:       89 44 24 08             mov    DWORD PTR [esp+0x8],eax
 80485dc:       c7 44 24 04 44 00 00    mov    DWORD PTR [esp+0x4],0x44
 80485e3:       00 
 80485e4:       c7 04 24 60 99 04 08    mov    DWORD PTR [esp],0x8049960
 80485eb:       e8 d0 fd ff ff          call   80483c0 <fgets@plt>
 80485f0:       c7 04 24 03 87 04 08    mov    DWORD PTR [esp],0x8048703
 80485f7:       e8 04 fe ff ff          call   8048400 <puts@plt>
 80485fc:       b8 00 00 00 00          mov    eax,0x0
 8048601:       c9                      leave  
 8048602:       c3                      ret    