#!/bin/bash

# install wordpress files
curl -LO https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
cp ./wordpress/wp-config-sample.php ./wordpress/wp-config.php
rm -rf /var/www/html
mv ./wordpress /var/www/html

# Change www properties
chmod -R 0755 /var/www/html
chown -R www-data:www-data /var/www/html


# Place current IP in dump.SQL
CURRENT_IP="$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')"
sed -i "s/CURRENT_IP/$CURRENT_IP/g" /root/dump.sql

# setup MySQL database user
sudo mysql -uroot -proot -hlocalhost -e "DROP DATABASE IF EXISTS database_name_here; CREATE DATABASE database_name_here;  GRANT ALL PRIVILEGES ON *.* TO 'username_here'@'localhost' IDENTIFIED BY '2!3swZ$NVO(wcigcw('; FLUSH PRIVILEGES;"

# import SQL DB
mysql -uroot -proot database_name_here < /root/dump.sql

# restart services to take new configurations
service php-fpm restart
service mysql restart
service nginx restart
