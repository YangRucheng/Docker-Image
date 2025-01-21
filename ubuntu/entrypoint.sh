#! /bin/bash

if [ -n "$ROOT_PASSWORD" ]; then
  echo "root:$ROOT_PASSWORD" | chpasswd
fi

mkdir -p /run/sshd \
&& echo "该镜像只持久化 /home 目录" > /root/README.txt \
&& chmod 600 /root/.ssh \
&& chmod 400 /root/.ssh/authorized_keys \
&& /usr/sbin/sshd -D 

exec "$@"