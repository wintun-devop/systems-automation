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

add-apt-repository ppa:ondrej/php -y
apt update -y

apt install -y php8.2 php8.2-cli php8.2-fpm php8.2-gd php8.2-xml php8.2-mbstring php8.2-zip php8.2-gettext php8.2-soap php8.2-curl php8.2-mysql php8.2-zmq libapache2-mod-php8.2

#expose the php packages information
echo "<?php phpinfo() ?>" >> /var/www/html/info.php


systemctl restart php8.2-fpm

systemctl restart apache2

php -m | grep -E 'phar|json|gd|dom|PDO|zip|gettext|soap|curl|iconv|ctype|fileinfo|xml|simplexml|mbstring|zlib|zmq'
