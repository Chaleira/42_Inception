echo "Setting up WordPress..."
while ! nc -z ${DATABASE_HOST} ${DATABASE_PORT}; do
    sleep 1
done
echo "Database is up!"

wp core install --allow-root --url=${DOMAIN} --title="Inception" --admin_user=${BACKEND_ADMIN} --admin_password=${BACKEND_ADMIN_PASSWORD} --admin_email=${BACKEND_ADMIN_EMAIL}
wp user create --allow-root ${BACKEND_USER} ${BACKEND_USER_EMAIL} --user_pass=${BACKEND_USER_PASSWORD} --role=author

mkdir -p /run/php
touch /run/php/php7.4-fpm.pid

php-fpm7.4 -F -R
