FROM kalilinux/kali-linux-docker

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

RUN apt-get update --fix-missing
RUN apt-get install -y vim curl silversearcher-ag apt-file git

# Footprinting / Information-Gathering
RUN apt-get install -y whois dnsutils dnsmap nmap theharvester dmitry knockpy
RUN curl -o /usr/local/bin/googler https://raw.githubusercontent.com/jarun/googler/v2.3/googler && chmod +x /usr/local/bin/googler
COPY bin/gathering /usr/local/bin/gathering

# Reverse Engineering
RUN apt-get install -y set

# Pentest Framework
RUN apt-get install -y metasploit-framework

# MITM / Sniffing
RUN apt-get install -y mitmproxy dsniff

# Bruteforce
RUN apt-get install -y hydra

# Web Scanner
RUN apt-get install -y nikto wpscan wapiti w3af-console

# SQL Injection
RUN apt-get install -y sqlmap themole

# Phishing
RUN apt-get install -y httrack

# DDOS Tools
RUN curl -o /usr/local/bin/slowloris https://raw.githubusercontent.com/jcherqui/dotfiles/master/bin/slowloris.pl && chmod +x /usr/local/bin/slowloris
RUN git clone https://github.com/noxxi/p5-io-socket-ssl && cd p5-io-socket-ssl && perl Makefile.PL && make && make install && rm -r /p5-io-socket-ssl
RUN apt-get install t50

## Kickthemout
RUN apt-get install -y python-pip
RUN git clone https://github.com/k4m4/kickthemout /opt/kickthemout && cd /opt/kickthemout/ && pip install -r requirements.txt && ln -s /opt/kickthemout/kickthemout.py /usr/local/bin/kickthemout && chmod +x kickthemout.py
