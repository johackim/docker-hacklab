FROM kalilinux/kali-linux-docker

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

RUN apt-get update --fix-missing
RUN apt-get install -y vim curl silversearcher-ag apt-file git
RUN apt-file update

# Reverse Engineering
RUN apt-get install -y set

# Pentest Framework
RUN apt-get install -y metasploit-framework websploit

# MITM / Sniffing
RUN apt-get install -y mitmproxy dsniff

# Crack password
RUN apt-get install -y hydra john

# Web Scanner
RUN apt-get update --fix-missing
RUN apt-get install -y nikto wpscan wapiti
# RUN apt-get install -y w3af

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

# NMAP vulscan
RUN curl -s http://www.computec.ch/projekte/vulscan/download/nmap_nse_vulscan-2.0.tar.gz | tar xzvf - -C /usr/share/nmap/scripts/

# Footprinting / Information-Gathering
RUN apt-get install -y whois dnsutils dnsmap nmap theharvester dmitry knockpy
RUN cd /root && \
    git clone https://github.com/1N3/Sn1per.git && \
    cd ~/Sn1per && \
    wget https://raw.githubusercontent.com/menzow/sn1per-docker/master/install.sh && \
    chmod +x install.sh && \
    ./install.sh
RUN curl -o /usr/local/bin/googler https://raw.githubusercontent.com/jarun/googler/v2.3/googler && chmod +x /usr/local/bin/googler
COPY bin/gathering /usr/local/bin/gathering
