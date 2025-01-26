#!/bin/bash

umask ${UMASK}

if [ "$1" = "version" ]; then
  ./alist version
else
  chown -R ${PUID}:${PGID} /opt/alist/
  exec su-exec ${PUID}:${PGID} ./alist server --no-prefix
fi