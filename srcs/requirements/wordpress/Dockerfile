FROM debian:buster

EXPOSE 9000

RUN apt update \
	&& apt install -y wget \
	php7.3 \
	php-fpm \
	php-mysql \
	mariadb-client

RUN cd /usr/local/bin/ \
	&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& mv wp-cli.phar wp \
	&& chmod +x wp \
	&& mkdir -p  /run/php

COPY www.conf /etc/php/7.3/fpm/pool.d/

COPY wp-conf.sh /wp-conf.sh

ENTRYPOINT [ "/bin/bash", "/wp-conf.sh" ]

CMD ["php-fpm7.3", "-F"]