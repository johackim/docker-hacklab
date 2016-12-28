FROM kalilinux/kali-linux-docker

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

RUN apt-get update --fix-missing
RUN apt-get install -y vim curl silversearcher-ag apt-file git

# Information-Gathering
RUN apt-get install -y whois dnsutils dnsmap nmap theharvester dmitry googler knockpy

# Reverse Engineering
RUN apt-get install -y set

# Pentest Framework
RUN apt-get install -y metasploit-framework

# MITM / Sniffing
RUN apt-get install -y mitmproxy dsniff

# Bruteforce
RUN apt-get install -y hydra

# Web Scanner
RUN apt-get install -y nikto wpscan wapiti

# SQL Injection
RUN apt-get install -y sqlmap themole

# Phishing
RUN apt-get install -y httrack

COPY bin/gathering /usr/local/bin/
