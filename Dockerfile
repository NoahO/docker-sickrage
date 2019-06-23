FROM linuxserver/sickchill

COPY 40-sickchill /etc/cont-init.d
COPY phpsed.php /

RUN apk add --no-cache \
	--repository http://nl.alpinelinux.org/alpine/edge/main \
	php-cli

RUN git clone https://github.com/clinton-hall/nzbToMedia /root/nzbtomedia

RUN chown -R abc:abc /root/nzbtomedia

VOLUME /nzbtomedia

HEALTHCHECK --start-period=600s CMD curl -f http://localhost:8081/sickchill || exit 1
