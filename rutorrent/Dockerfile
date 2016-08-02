FROM  mistercyp/rtorrent
MAINTAINER MisterCyp <https://github.com/MisterCyp/dockerfiles>

ENV UID=1000 \
    GID=1000 \
    WEBROOT=/ \
    PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

RUN echo "@commuedge http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
 && echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && echo "@community http://nl.alpinelinux.org/alpine/v3.3/community/" >> /etc/apk/repositories \
 && NB_CORES=${BUILD_CORES-`getconf _NPROCESSORS_CONF`} \
 && BUILD_DEPS=" \
    git \
    wget \
    subversion " \
 && apk -U add \
    ${BUILD_DEPS} \
 && mkdir -p /var/www && cd /var/www \
 && git clone https://github.com/Novik/ruTorrent.git rutorrent --depth=1 \
 && cd /var/www/rutorrent/plugins/ \
 && git clone https://github.com/Korni22/rutorrent-logoff logoff --depth=1 \
 && git clone https://github.com/xombiemp/rutorrentMobile.git mobile --depth=1 \
 && git clone https://github.com/Ardakilic/rutorrent-pausewebui pausewebui --depth=1 \
 && cd /var/www/rutorrent/plugins/theme/themes \
 && git clone https://github.com/Phlooo/ruTorrent-MaterialDesign.git Material --depth=1 \
 && cd /var/www/rutorrent/plugins/theme/themes \
 && git clone https://github.com/exetico/FlatUI.git \
 && mv FlatUI/FlatUI_* . && rm -rf FlatUI \
 && cd /var/www/rutorrent/plugins/theme/themes \
 && git clone https://github.com/Phlooo/ruTorrent-MaterialDesign.git Material \
 && mv /var/www/rutorrent /var/www/torrent \
 && apk del ${BUILD_DEPS} \
 && deluser svn && delgroup svnusers \
 && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /

RUN chmod +x /usr/bin/*

VOLUME /data /var/www/torrent/share/users /home/torrent /var/log/nginx
EXPOSE 80 49184 49184/udp

LABEL description="BitTorrent client with WebUI front-end"

CMD ["tini","--","startup"]
