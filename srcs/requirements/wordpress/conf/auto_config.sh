#!/bin/bash

sleep 10

if [ ! -d "/run/php" ]; then
	mkdir -p /run/php
fi

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
	echo "CONFIG CREA" >&2
    wp config create	--allow-root \
					--dbname=$DB_NAME \
					--dbuser=$DB_USER \
					--dbpass=$DB_PASSWORD \
					--dbhost=mariadb:3306 --path='/var/www/wordpress'
fi

/usr/sbin/php-fpm7.3 -F