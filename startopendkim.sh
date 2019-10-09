#!/bin/bash

if [[ ! -z $LOG_SOCKET ]]; then
  ln -s $LOG_SOCKET /dev/log
fi

cp -L /etc/opendkim/keys-temp/* /etc/opendkim-keys
chown -R opendkim:opendkim /etc/opendkim-keys/
chmod -R g-rwx,o-rwx /etc/opendkim-keys/
exec /usr/sbin/opendkim -f -x /etc/opendkim/opendkim.conf
