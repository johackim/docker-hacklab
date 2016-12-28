FROM kalilinux/kali-linux-docker

RUN apt-get update --fix-missing
RUN apt-get install -y metasploit-framework mitmproxy
