#!/bin/sh
addgroup -g ${GID} rufy && adduser -h /var/www/RuFy -s /bin/sh -D -G rufy -u ${UID} rufy

cp -v /var/www/RuFy/config/db-init.sqlite3 /var/www/RuFy/db.sqlite3

chown -R rufy:rufy /var/www/RuFy /watch /var/lib/nginx /tmp

supervisord -c /usr/local/etc/supervisord.conf
