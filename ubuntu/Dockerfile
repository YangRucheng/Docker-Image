FROM ubuntu:24.04

ARG ROOT_PASSWD=yangrucheng

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y openssh-server python3 python3-pip curl iputils-ping nano htop tmux net-tools nmap git sudo

RUN pip config set global.index-url http://mirrors.cloud.tencent.com/pypi/simple \
    && pip config set global.trusted-host mirrors.cloud.tencent.com

COPY ubuntu.sources /etc/apt/sources.list.d/ubuntu.sources

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#Port 22/Port 1314/' /etc/ssh/sshd_config \
    && wget -O - https://cdn.jsdelivr.net/gh/YangRucheng/Config-Backup/init.sh | bash

COPY entrypoint.sh /entrypoint.sh

VOLUME [ "/home" ]

EXPOSE 1314

ENTRYPOINT ["sh", "-c", "/entrypoint.sh"]
