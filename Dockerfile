FROM kalilinux/kali-linux-docker

########
# INIT #
########

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

# Packages
RUN echo 'deb http://old.kali.org/kali sana main non-free contrib' >> /etc/apt/sources.list
RUN apt-get update --fix-missing

# Locale
RUN apt-get install -y locales && sed -i -e 's/\# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8

# Utils
RUN apt-get install -y vim curl silversearcher-ag apt-file git zsh ncdu && \
    git clone https://github.com/ston3o/oh-my-zsh ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \
    sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="red"/g' ~/.zshrc && \
    apt-file update

# Dependencies
RUN apt-get install -y zenity mingw32 xterm gnome-terminal default-jre default-jdk aapt dex2jar zlib1g-dev libmagickwand-dev imagemagick zipalign cowpatty bully lighttpd macchanger php-cgi isc-dhcp-server python3-dev python3-setuptools python-pip libssl-dev xprobe2 golang-go && \
    apt-get install -y wine && \
    easy_install3 pip && \
    git clone https://github.com/noxxi/p5-io-socket-ssl && cd p5-io-socket-ssl && perl Makefile.PL && make && make install && rm -r /p5-io-socket-ssl

# MOTD
RUN echo '[ ! -z "$TERM" -a -r /etc/motd ] && cat /etc/motd' >> ~/.zshrc && \
    apt-get install -y figlet && \
    figlet -f small "HACKLAB" > /etc/motd && \
    sed -i '$ d' /etc/motd && echo "https://github.com/ston3o/docker-hacklab" >> /etc/motd && echo '\n' >> /etc/motd

# Cheats
RUN pip install cheat
RUN echo "_cmpl_cheat() {\n\
    reply=($(cheat -l | cut -d' ' -f1))\n\
}\n\
compctl -K _cmpl_cheat cheat\n"\
>> /root/.zshrc
RUN apt-get install -y nodejs-legacy npm && \
    npm cache clean -f && \
    npm install -g n && \
    n stable && \
    npm i -g Brosec

# Add files
ADD .cheat/ /root/.cheat/
ADD wordlists /usr/share/
ADD README.md /root/
ADD Dockerfile /root/
ADD bin/* /usr/local/bin/

WORKDIR /root

#################
# INSTALL TOOLS #
#################

# Footprinting / Information-Gathering / OSINT / Fingerprint
RUN apt-get install -y whois dnsutils dnsmap nmap theharvester dmitry knockpy netdiscover
RUN git clone https://github.com/1N3/Sn1per.git /opt/Sn1per && cd /opt/Sn1per && chmod +x install.sh && ./install.sh
RUN curl -o /usr/local/bin/googler https://raw.githubusercontent.com/jarun/googler/v2.3/googler && chmod +x /usr/local/bin/googler
RUN pip install shodan
RUN git clone https://github.com/maurosoria/dirsearch /opt/dirsearch && \
    git clone https://github.com/penafieljlm/inquisitor /opt/inquisitor && \
    git clone https://github.com/maldevel/EmailHarvester /opt/EmailHarvester && \
    git clone https://github.com/killswitch-GUI/SimplyEmail/ /opt/SimplyEmail && \
    git clone https://github.com/HatBashBR/ShodanHat /opt/ShodanHat && \
    git clone https://github.com/graniet/operative-framework /opt/operative-framework && \
    git clone https://github.com/m4ll0k/Infoga.git /opt/Infoga && \
    git clone https://github.com/kahunalu/pwnbin.git /opt/pwnbin && \
    git clone https://github.com/vesche/scanless /opt/scanless && \
    git clone https://github.com/techgaun/github-dorks /opt/github-dorks && \
    git clone https://github.com/aboul3la/Sublist3r /opt/Sublist3r && \
    git clone https://github.com/TheRook/subbrute /opt/subbrute && \
    git clone https://github.com/utiso/dorkbot /opt/dorkbot && \
    git clone https://github.com/DataSploit/datasploit /opt/datasploit && \
    git clone https://github.com/aancw/Belati /opt/Belati
RUN apt-get install -y metagoofil

# Pentest Framework
# RUN pip install pwntools
RUN apt-get install -y metasploit-framework websploit && \
    git clone https://github.com/x3omdax/PenBox /opt/PenBox && \
    git clone https://github.com/golismero/golismero.git /opt/golismero && cd /opt/golismero && pip install -r requirements.txt && \
    git clone https://github.com/nil0x42/phpsploit /opt/phpsploit && \
    git clone https://github.com/C0reL0ader/EaST /opt/EaST && \
    git clone https://github.com/leviathan-framework/leviathan /opt/leviathan && \
    git clone https://github.com/Ekultek/Pybelt /opt/Pybelt && \
    git clone https://github.com/nccgroup/redsnarf /opt/redsnarf && \
    git clone https://github.com/FreelancePentester/ddos-script /opt/ddos-script

# MITM, ARP poisoning/spoofing, Sniffing
RUN apt-get install -y mitmproxy dsniff mitmf tcpdump ngrep
RUN git clone https://github.com/r00t-3xp10it/morpheus /opt/morpheus && \
    git clone https://github.com/evilsocket/bettercap && \
    git clone https://github.com/brannondorsey/mitm-router && \
    git clone https://github.com/LionSec/xerosploit /opt/xerosploit

# Spoofing email
RUN apt-get install -y sendemail
RUN git clone https://github.com/BishopFox/spoofcheck /opt/spoofcheck

# Crack password
# RUN git clone https://github.com/berzerk0/Probable-Wordlists /opt/Probable-Wordlists
RUN apt-get install -y hydra john crunch cewl
RUN git clone https://github.com/Mebus/cupp /opt/cupp && \
    git clone https://github.com/k4m4/dymerge.git /opt/dymerge && \
    git clone https://github.com/AlessandroZ/LaZagne && \
    git clone https://github.com/LandGrey/pydictor.git /opt/pydictor

# Check passwords
RUN git clone https://github.com/lightos/credmap /opt/credmap

# Hash Manipulation
RUN git clone https://github.com/ekultek/dagon.git /opt/dagon && \
    gem install hashdata

# Vulnerability Scanner (SQL, XSS, LFI, RFI etc...)
RUN apt-get install -y arachni nikto wpscan wapiti w3af fimap
RUN git clone https://github.com/m4ll0k/Spaghetti /opt/Spaghetti && \
    git clone https://github.com/faizann24/XssPy /opt/XssPy && \
    git clone https://github.com/UltimateHackers/Striker && \
    git clone https://github.com/v3n0m-Scanner/V3n0M-Scanner /opt/V3n0M-Scanner && \
    git clone https://github.com/D35m0nd142/LFISuite /opt/LFISuite && \
    git clone https://github.com/P0cL4bs/Kadimus /opt/Kadimus && \
    git clone https://github.com/WhitewidowScanner/whitewidow /opt/whitewidow

# SQL Injection
RUN apt-get install -y sqlmap themole

# Phishing
RUN apt-get install -y httrack && \
    git clone https://github.com/kgretzky/evilginx /opt/evilginx

# DOS Tools
RUN apt-get install t50 && \
    curl -o /usr/local/bin/slowloris https://raw.githubusercontent.com/ston3o/dotfiles/master/bin/slowloris.pl && chmod +x /usr/local/bin/slowloris && \
    git clone https://github.com/Souhardya/Warchild /opt/Warchild

# Kickthemout
RUN git clone https://github.com/k4m4/kickthemout /opt/kickthemout && \
    cd /opt/kickthemout/ && \
    python -m pip install -r requirements.txt && \
    ln -s /opt/kickthemout/kickthemout.py /usr/local/bin/kickthemout && \
    chmod +x kickthemout.py

# NMAP NSE Script vulscan
RUN curl -s http://www.computec.ch/projekte/vulscan/download/nmap_nse_vulscan-2.0.tar.gz | tar xzvf - -C /usr/share/nmap/scripts/ && \
    wget -P /usr/share/nmap/scripts/ https://raw.githubusercontent.com/cldrn/nmap-nse-scripts/master/scripts/smb-vuln-ms17-010.nse

# Wireless, WEP WPA
RUN apt-get install -y wifite wifiphisher mdk3 tshark
RUN git clone https://github.com/kylemcdonald/FreeWifi /opt/FreeWifi && cd /opt/FreeWifi && pip install -r requirements.txt && \
    git clone https://github.com/FluxionNetwork/fluxion /opt/fluxion && \
    git clone https://github.com/chrizator/netattack /opt/netattack && \
    git clone https://github.com/chrizator/netattack2/ /opt/netattack2 && \
    git clone https://github.com/s0lst1c3/eaphammer /opt/eaphammer && \
    git clone https://github.com/P0cL4bs/WiFi-Pumpkin /opt/Wifi-Pumpkin && \
    git clone https://github.com/M1ND-B3ND3R/BoopSuite /opt/BoopSuite

# Reverse Engineering
RUN apt-get install -y apktool set && \
    git clone https://github.com/radare/radare2 /opt/radare2

# Backdoor / Remote Access Trojan
RUN git clone https://github.com/Screetsec/TheFatRat.git /opt/TheFatRat && \
    echo "*\n*\n*\n*\nmsfconsole\nmsfvenom\nbackdoor-factory\nsearchsploit" > /opt/TheFatRat/config/config.path && \
    chmod +x /opt/TheFatRat/fatrat
RUN git clone https://github.com/jbreed/apkinjector /opt/apkinjector && chmod +x /opt/apkinjector/apkinjector
RUN git clone https://github.com/dana-at-cp/backdoor-apk /opt/backdoor-apk && \
    sed -i -e 's/ZIPALIGN=.*$/ZIPALIGN=\/usr\/bin\/zipalign/g' /opt/backdoor-apk/backdoor-apk/backdoor-apk.sh
RUN git clone https://github.com/r00t-3xp10it/backdoorppt /opt/backdoorppt && \
    sed -i -e 's/BASH_TRANSFORMATION=NO/BASH_TRANSFORMATION=YES/g' /opt/backdoorppt/settings && \
    sed -i -e 's/RESOURCEHACKER_BYPASS=NO/RESOURCEHACKER_BYPASS=YES/g' /opt/backdoorppt/settings
RUN git clone https://github.com/Screetsec/microsploit /opt/microsploit && \
    git clone https://github.com/nccgroup/Winpayloads /opt/Winpayloads && \
    git clone https://github.com/tiagorlampert/CHAOS /opt/CHAOS && \
    git clone https://github.com/vesche/basicRAT /opt/basicRAT && \
    git clone https://github.com/n1nj4sec/pupy.git

# Search exploit
RUN apt-get install -y exploitdb # `searchsploit`
RUN git clone https://github.com/vulnersCom/getsploit /opt/getsploit && \
    git clone https://github.com/1N3/findsploit /opt/findsploit && \
    git clone https://github.com/MalwareReverseBrasil/malwaresearch /opt/malwaresearch

# Post exploitation
RUN git clone https://github.com/nathanlopez/Stitch /opt/Stitch && \
    git clone https://github.com/putterpanda/mimikittenz /opt/mimikittenz && \
    git clone https://github.com/huntergregal/mimipenguin /opt/mimipenguin

# Privilege escalation
RUN git clone https://github.com/ngalongc/AutoLocalPrivilegeEscalation /opt/AutoLocalPrivilegeEscalation && \
    git clone https://github.com/rasta-mouse/Sherlock /opt/Sherlock && \
    git clone https://github.com/AlessandroZ/BeRoot /opt/BeRoot && \
    git clone https://github.com/NullArray/MIDA-Multitool.git /opt/MIDA && \
    git clone https://github.com/nilotpalbiswas/Auto-Root-Exploit

# Forensic
RUN apt-get install -y extract

# Geolocalisation
RUN git clone https://github.com/maldevel/IPGeoLocation /opt/IPGeoLocation && \
    cd /opt/IPGeoLocation && \
    pip3 install -r requirements.txt && \
    chmod +x /opt/IPGeoLocation/ipgeolocation.py

# Shellcode
RUN git clone https://github.com/reyammer/shellnoob /opt/shellnoob

# Wordpress
RUN git clone https://github.com/n00py/WPForce /opt/WPForce && \
    git clone https://github.com/m4ll0k/WPSeku /opt/WPSeku

# Bypass CloudFlare
RUN git clone https://github.com/HatBashBR/HatCloud /opt/HatCloud && \
    git clone https://github.com/m0rtem/CloudFail /opt/CloudFail

# Steganography
RUN git clone https://github.com/solusipse/spectrology /opt/spectrology

# Honeypot
RUN git clone https://github.com/droberson/ssh-honeypot /opt/ssh-honeypot && \
    git clone https://github.com/micheloosterhof/cowrie /opt/cowrie

# Reverse shell
RUN apt-get install -y netcat

# Detect WAF
RUN git clone https://github.com/EnableSecurity/wafw00f /opt/wafw00f

# Remove file metadata
RUN apt-get install -y mat

# AV Evasion, Dropper
RUN git clone https://github.com/jbreed/apkwash /opt/apkwash && \
    git clone https://github.com/D4Vinci/Dr0p1t-Framework /opt/Dr0p1t-Framework

# Disassembler
RUN git clone https://github.com/intezer/docker-ida

# Fuzzing
RUN git clone https://github.com/joxeankoret/nightmare

# Paquet manipulation
RUN apt-get install -y hping3 scapy

#########
# CLEAN #
#########

RUN apt-get autoremove -y && \
    rm -rf /tmp/* && \
    rm -rf /var/lib/{apt,dpkg,cache,log,tmp}/*
