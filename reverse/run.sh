#!/bin/sh
touch /var/run/nginx.pid
chown -R $UID:$GID /etc/nginx /var/log/nginx /var/run/nginx.pid /sites-enabled /conf.d /certs /var/www
chmod -R 700 /certs

/usr/bin/supervisord -c /etc/supervisord.conf