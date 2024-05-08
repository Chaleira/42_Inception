sleep 10
if ! [[ -d "/run/php" ]]; then
    mkdir /run/php
fi
wp config create    --allow-root \
                    --path='/var/www/wordpress' \
                    --dbname=$SQL_DATABASE \
                    --dbuser=$SQL_USER \
                    --dbpass=$SQL_PASSWORD \
                    --dbhost=mariadb:3306
wp core install --allow-root
wp user create
/usr/sbin/php-fpm7.3 -F
