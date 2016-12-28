Docker Hacklab
===

> My personal hacklab

Quick Start
---

```bash
# Run Hacklab
docker run -d --name hacklab --net=host -it jcherqui/docker-hacklab

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

Links
---

- http://sectools.org/
- http://pwnwiki.io/
- https://www.cybrary.it/
- http://null-byte.wonderhowto.com/
- https://github.com/enaqx/awesome-pentest
- https://github.com/Hack-with-Github/Awesome-Hacking
- https://github.com/sindresorhus/awesome#security
- https://github.com/gchq/CyberChef

License
---

MIT

Free Software, Hell Yeah !
