#!/bin/bash

if [ -d "/var/lib/mysql/$DATABASE_NAME" ] 
then
    echo "Database already exists"
else

service mariadb start

sleep 5

mysql -e "CREATE DATABASE ${DATABASE_NAME};"
mysql -e "CREATE USER '${DATABASE_USER}'@'%' IDENTIFIED BY '${DATABASE_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON mydatabase.* TO '${DATABASE_USER}'@'%' IDENTIFIED BY '${DATABASE_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

sleep 5

service mariadb stop
fi
exec mysqld_safe --bind-address=0.0.0.0
