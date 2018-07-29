Docker Hacklab
===

> My personal hacklab, create your own.

French article: https://blog.ston3o.me/creer-hacklab-virtuel-docker/

Quick Start
---

```
$ docker run --name hacklab --net=host --privileged -it ston3o/docker-hacklab zsh
 _  _   _   ___ _  ___      _   ___
| || | /_\ / __| |/ / |    /_\ | _ )
| __ |/ _ \ (__| ' <| |__ / _ \| _ \
|_||_/_/ \_\___|_|\_\____/_/ \_\___/
https://github.com/ston3o/docker-hacklab
```

Alias
---

```bash
# ~/.bashrc
alias hacklab='docker run -d --name hacklab --net=host --privileged=true -v /tmp/:/mnt -it ston3o/docker-hacklab bash > /dev/null 2>&1; docker start hacklab > /dev/null; docker exec -it -e COLUMNS=$COLUMNS -e LINES=$LINES -e TERM=$TERM hacklab zsh'
```

Other useful docker commands
---

```bash
# Vulnerability scanners
$ docker run -d --name nessus -p 8834:8834 infoslack/nessus
$ docker run -d --name openvas -p 443:443 -p 9390:9390 -p 9391:9391 mikesplain/openvas
$ docker run --rm -it menzo/sn1per-docker sniper <example.com>

# Run vulnerable web application
$ docker run -d --name dvwa -it -p 80:80 vulnerables/web-dvwa

# Search Mobile Vulns
$ docker run -d --name mobsf -it -p 8000:8000 opensecurity/mobsf:latest
```

Exploit database
---

- http://cve.mitre.org/
- http://0day.today/
- https://nvd.nist.gov/
- http://www.securityfocus.com/bid/
- https://www.exploit-db.com/
- http://www.cvedetails.com/

Search Engines
---

- https://www.shodan.io/
- https://censys.io/
- https://www.zoomeye.org/

Doxing / OSINT
---

- http://www.peekyou.com/
- https://pipl.com/
- https://iplogger.org/

Other resources
---

- http://sectools.org/
- http://pwnwiki.io/
- https://www.cybrary.it/
- http://null-byte.wonderhowto.com/
- https://n0where.net/
- https://www.kitploit.com/
- https://pentestlab.blog/
- http://haxf4rall.com/
- http://www.hackingarticles.in/
- https://hackademics.fr
- https://pentest-tools.com/
- https://instant-hack.io/
- http://zenk-security.com/
- https://www.hacksplaining.com/
- https://www.punycoder.com/
- https://securityonline.info
- http://hardsploit.io
- https://weleakinfo.com/
- https://gexos.github.io/Hacking-Tools-Repository/
- https://penetration-testing.zeef.com/jeroen.rijken
- http://www.funinformatique.com/google-dorks-hackez-requete-google/
- https://highon.coffee/blog/penetration-testing-tools-cheat-sheet/
- http://pentestmonkey.net/cheat-sheet/sql-injection/mysql-sql-injection-cheat-sheet
- https://ctf365.com/

Github repositories
---

- https://github.com/cSploit/android
- https://github.com/enaqx/awesome-pentest
- https://github.com/Hack-with-Github/Awesome-Hacking
- https://github.com/sindresorhus/awesome#security
- https://github.com/carpedm20/awesome-hacking
- https://github.com/brannondorsey/wifi-cracking
- https://github.com/gchq/CyberChef
- https://github.com/danielmiessler/SecLists
- https://github.com/We5ter/Scanners-Box
- https://github.com/vitalysim/Awesome-Hacking-Resources

Youtube Channels
---

- https://www.youtube.com/user/Hak5Darren/videos
- https://www.youtube.com/user/DEFCONConference/videos
- https://www.youtube.com/user/BlackHatOfficialYT/videos
- https://www.youtube.com/user/JackkTutorials/videos
- https://www.youtube.com/channel/UCO51Z4c1R8EPHZioGwgBmDw/videos
- https://www.youtube.com/playlist?list=PLkRo97mCIn9lgvE7AskNsmwJVOlJX2zaI
- https://www.youtube.com/channel/UC286ntgASMskhPIJQebJVvA/videos
- https://www.youtube.com/user/gaytony10/playlists
- https://www.youtube.com/user/bhargavtandel/videos

License
---

GNU GPL v3.0

**Free Software, Hell Yeah!**
