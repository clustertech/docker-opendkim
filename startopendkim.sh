#!/bin/bash

rm -f /var/run/*.pid /run/*.pid
cp -L /etc/opendkim/keys-temp/* /etc/opendkim-keys
chown -R opendkim:opendkim /etc/opendkim-keys/
chmod -R g-rwx,o-rwx /etc/opendkim-keys/
rsyslogd
exec /usr/sbin/opendkim -f -x /etc/opendkim/opendkim.conf
