#!/bin/sh

mysql_install_db

service mysql start

if [ -d "/var/lib/mysql/$WP_DB" ]
then
	echo "WARNING: Data base exist";
else
	mysql -e "CREATE DATABASE IF NOT EXISTS $WP_DB; GRANT ALL ON $WP_DB.* TO '$WP_USER'@'%' IDENTIFIED BY '$WP_PASS'; FLUSH PRIVILEGES;"
fi

service mysql stop

exec $@