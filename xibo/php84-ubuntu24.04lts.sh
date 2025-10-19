#!/bin/bash

# Update/Download package information from all configured sources
apt update -y

#Upgrading the downloaded packages
apt upgrade -y

#apache and necessary modules
apt install -y wget curl make unzip network-manager gcc net-tools lsb-release ca-certificates apt-transport-https gnupg software-properties-common

# install
apt install -y apache2


#get start the apache server
systemctl start apache2

#get enable the apache server to run alway on starup
systemctl enable --now apache2

#check ufw list(optional here)
ufw app list
ufw allow 'Apache'
ufw status


add-apt-repository ppa:ondrej/php -y

apt update -y 

apt install -y php8.4-cli php8.4-fpm php8.4-gd php8.4-xml php8.4-mbstring php8.4-zip php8.4-gettext php8.4-soap php8.4-curl php8.4-mysql php8.4-zmq

apt install -y php8.4 libapache2-mod-php8.4

#expose the php packages information
echo "<?php phpinfo() ?>" >> /var/www/html/info.php

systemctl restart php8.4-fpm

systemctl restart apache2

php -m | grep -E 'phar|json|gd|dom|PDO|zip|gettext|soap|curl|iconv|ctype|fileinfo|xml|simplexml|mbstring|zlib|zmq'






