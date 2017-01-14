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

Channels youtube
---

https://www.youtube.com/user/DEFCONConference/videos
https://www.youtube.com/user/BlackHatOfficialYT/videos

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
