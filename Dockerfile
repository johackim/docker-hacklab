FROM kalilinux/kali-linux-docker

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

# Packages
RUN echo 'deb http://old.kali.org/kali sana main non-free contrib' >> /etc/apt/sources.list
RUN apt-get update --fix-missing

# Locale
RUN apt-get install -y locales
RUN sed -i -e 's/\# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
RUN locale-gen

# Utils
RUN apt-get install -y vim curl silversearcher-ag apt-file git
RUN apt-file update

RUN echo '[ ! -z "$TERM" -a -r /etc/motd ] && cat /etc/motd' >> /etc/bash.bashrc
RUN apt-get install -y figlet
RUN figlet -f small "HACKLAB" > /etc/motd
RUN sed -i '$ d' /etc/motd && echo "https://github.com/jcherqui/docker-hacklab" >> /etc/motd && echo '\n' >> /etc/motd

# Pentest Framework
RUN apt-get install -y metasploit-framework websploit

# MITM / Sniffing / ARP poisoning
ADD bin/empty /usr/local/bin/empty
RUN apt-get install -y mitmproxy dsniff mitmf
RUN git clone https://github.com/r00t-3xp10it/morpheus /opt/morpheus

# Crack password
RUN apt-get install -y hydra john

# Web Scanner
RUN apt-get install -y nikto wpscan wapiti w3af

# SQL Injection
RUN apt-get install -y sqlmap themole

# Phishing
RUN apt-get install -y httrack

# DDOS Tools
RUN curl -o /usr/local/bin/slowloris https://raw.githubusercontent.com/jcherqui/dotfiles/master/bin/slowloris.pl && chmod +x /usr/local/bin/slowloris
RUN git clone https://github.com/noxxi/p5-io-socket-ssl && cd p5-io-socket-ssl && perl Makefile.PL && make && make install && rm -r /p5-io-socket-ssl
RUN apt-get install t50

# Kickthemout
RUN apt-get install -y python-pip
RUN git clone https://github.com/k4m4/kickthemout /opt/kickthemout && cd /opt/kickthemout/ && pip install -r requirements.txt && ln -s /opt/kickthemout/kickthemout.py /usr/local/bin/kickthemout && chmod +x kickthemout.py

# NMAP NSE Script vulscan
RUN curl -s http://www.computec.ch/projekte/vulscan/download/nmap_nse_vulscan-2.0.tar.gz | tar xzvf - -C /usr/share/nmap/scripts/

# Footprinting / Information-Gathering
RUN apt-get install -y whois dnsutils dnsmap nmap theharvester dmitry knockpy netdiscover
RUN cd /root && \
    git clone https://github.com/1N3/Sn1per.git && \
    cd ~/Sn1per && \
    wget https://raw.githubusercontent.com/1N3/Sn1per/master/install.sh && \
    chmod +x install.sh && \
    ./install.sh
RUN curl -o /usr/local/bin/googler https://raw.githubusercontent.com/jarun/googler/v2.3/googler && chmod +x /usr/local/bin/googler
ADD bin/gathering /usr/local/bin/gathering

# Wireless
RUN apt-get install -y cowpatty wifite
RUN git clone https://github.com/kylemcdonald/FreeWifi /opt/FreeWifi && cd /opt/FreeWifi && pip install -r requirements.txt

# Reverse Engineering
RUN apt-get install -y apktool set

# Automated Backdoor
RUN apt-get install -y zenity mingw32 monodevelop xterm gnome-terminal default-jre default-jdk aapt dex2jar zlib1g-dev libmagickwand-dev imagemagick zipalign
RUN git clone https://github.com/Screetsec/TheFatRat.git /opt/TheFatRat
RUN echo "*\n*\n*\n*\nmsfconsole\nmsfvenom\nbackdoor-factory\nsearchsploit" > /opt/TheFatRat/config/config.path
RUN chmod +x /opt/TheFatRat/fatrat
RUN git clone https://github.com/dana-at-cp/backdoor-apk /opt/backdoor-apk
RUN sed -i -e 's/ZIPALIGN=.*$/ZIPALIGN=\/usr\/bin\/zipalign/g' /opt/backdoor-apk/backdoor-apk/backdoor-apk.sh

# Search exploit
RUN apt-get install -y exploitdb # `searchsploit`

# Check passwords
RUN git clone https://github.com/lightos/credmap /opt/credmap

# Trojan
RUN git clone https://github.com/vesche/basicRAT /opt/basicRAT

# Other tools
RUN wget https://raw.githubusercontent.com/FreelancePentester/ddos-script/master/Ddosv5.0.sh -O /usr/local/bin/ddos-script && chmod +x /usr/local/bin/ddos-script

ADD wordlists /usr/share/
