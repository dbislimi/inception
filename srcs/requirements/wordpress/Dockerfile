FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y php7.4 php7.4-fpm php7.4-cli php7.4-mysql mariadb-client
RUN mkdir -p /run/php

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/.

ENTRYPOINT [ "php-fpm7.4", "-F" ]