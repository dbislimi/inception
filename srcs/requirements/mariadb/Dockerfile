FROM debian:buster

RUN apt update && apt upgrade -y && apt install nginx -y && apt install vim -y && apt install curl -y
RUN apt install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/init_db.sh .
RUN chmod +x /init_db.sh

RUN mkdir -p /var/run/mysqld && chown mysql:mysql /var/run/mysqld

ENTRYPOINT ["sh", "init_db.sh"]