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
- https://www.codebashing.com/

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
- https://github.com/infosecn1nja/Red-Teaming-Toolkit

Youtube Channels
---

- https://www.youtube.com/user/Hak5Darren/videos
- https://www.youtube.com/user/DEFCONConference/videos
- https://www.youtube.com/user/BlackHatOfficialYT/videos
- https://www.youtube.com/user/JackkTutorials/videos
- https://www.youtube.com/user/gaytony10/playlists
- https://www.youtube.com/user/bhargavtandel/videos
- https://www.youtube.com/channel/UC286ntgASMskhPIJQebJVvA/videos
- https://www.youtube.com/channel/UCO51Z4c1R8EPHZioGwgBmDw/videos
- https://www.youtube.com/channel/UC0ZTPkdxlAKf-V33tqXwi3Q/videos
- https://www.youtube.com/playlist?list=PLkRo97mCIn9lgvE7AskNsmwJVOlJX2zaI

Support me
---

I'd love to work on this project, but my time on this earth is limited, support my work to give me more time!

Please support me with a one-time or a monthly donation and help me continue my activities.

[![Github sponsor](https://img.shields.io/badge/github-Support%20my%20work-lightgrey?style=social&logo=github)](https://github.com/sponsors/johackim/)
[![ko-fi](https://img.shields.io/badge/ko--fi-Support%20my%20work-lightgrey?style=social&logo=ko-fi)](https://ko-fi.com/johackim)
[![Buy me a coffee](https://img.shields.io/badge/Buy%20me%20a%20coffee-Support%20my%20work-lightgrey?style=social&logo=buy%20me%20a%20coffee&logoColor=%23FFDD00)](https://www.buymeacoffee.com/johackim)
[![liberapay](https://img.shields.io/badge/liberapay-Support%20my%20work-lightgrey?style=social&logo=liberapay&logoColor=%23F6C915)](https://liberapay.com/johackim/donate)
[![Github](https://img.shields.io/github/followers/johackim?label=Follow%20me&style=social)](https://github.com/johackim)
[![Mastodon](https://img.shields.io/mastodon/follow/1631?domain=https%3A%2F%2Fmastodon.ethibox.fr&style=social)](https://mastodon.ethibox.fr/@johackim)
[![Twitter](https://img.shields.io/twitter/follow/_johackim?style=social)](https://twitter.com/_johackim)

License
---

GNU GPL v3.0

**Free Software, Hell Yeah!**
