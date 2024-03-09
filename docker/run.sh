#!/bin/sh

if [ -z "$( id -u node 2> /dev/null )" ]; then
    sed -i "s/^\(users:x\):100:/\1:$USER_GID:/" /etc/group
    adduser -D -u "$USER_UID" -G users -g node node
fi

exec su node -c "/usr/local/bin/node-red -u /data -p 8080"