FROM linuxserver/sickrage

COPY 40-sickrage /etc/cont-init.d
COPY phpsed.php /

RUN apk add --no-cache \
	--repository http://nl.alpinelinux.org/alpine/edge/main \
	php-cli

RUN git clone https://github.com/clinton-hall/nzbToMedia /root/nzbtomedia

RUN chown -R abc:abc /root/nzbtomedia

VOLUME /nzbtomedia

HEALTHCHECK --retries=8 CMD curl -f http://localhost:8081/sickrage/home || exit 1
