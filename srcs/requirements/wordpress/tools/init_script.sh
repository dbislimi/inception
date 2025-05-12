#!/bin/bash

set -e

cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

if [ ! -d "wp-content" ]; then
    ./wp-cli.phar core download --version=6.4.3 --allow-root
fi
if [ ! -f "wp-config.php" ]; then
	./wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWD --dbhost=mariadb:3306 --allow-root
fi
./wp-cli.phar core install --url=dbislimi.42.fr --title=inception --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PASSWD --admin_email=boss@bboss.com --allow-root

php-fpm7.4 -F