#!/bin/bash

sudo apt install ca-certificates apt-transport-https
wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -
sudo echo "deb https://packages.sury.org/php/ buster main" | tee /etc/apt/sources.list.d/php.list

sudo apt-get update

apt-get -y install php5.6 php5.6-fpm php5.6-cli php5.6-mysql php5.6-mcrypt


sed -i 's/cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/5.6/fpm/php.ini
sed -i 's/listen = \/run\/php\/php5.6-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php/5.6/fpm/pool.d/www.conf


chown -R www-data:www-data /home/vps/public_html/
chmod -R g+rw /home/vps/public_html/
