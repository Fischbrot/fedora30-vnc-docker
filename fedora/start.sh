#!/bin/sh

RPASSWD=`pwgen -c -n -1 10`
UPASSWD=fedora
echo "User: root Password: $RPASSWD"
echo "User: fedora Password: $UPASSWD"

#modify the password of root and fedora account
echo "root:$RPASSWD" | chpasswd
echo "fedora:$UPASSWD" | chpasswd

/usr/bin/supervisord -c /etc/supervisord.conf

