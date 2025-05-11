#!/bin/bash
set -e

mysqld_safe --datadir=/var/lib/mysql &

while ! mysqladmin ping --silent; do
    echo "waiting for mariadb server..."
    sleep 1
done

mysql -u root <<EOSQL
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWD}';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWD}';
FLUSH PRIVILEGES;
EOSQL

wait