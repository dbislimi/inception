FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install nginx -y && apt install vim -y && apt install curl -y

RUN apt-get install mariadb-server -y

RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/init_db.sh init_db.sh

RUN chmod +x /init_db.sh

RUN mkdir -p /var/run/mysqld

RUN chown -R mysql:mysql /var/run/mysqld

CMD ["/init_db.sh"]