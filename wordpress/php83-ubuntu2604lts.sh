#!/bin/bash

# Update/Download package information from all configured sources
apt update -y

#Upgrading the downloaded packages
apt upgrade -y

#apache and necessary modules
apt install -y wget curl make unzip network-manager gcc gnupg net-tools lsb-release ca-certificates apt-transport-https gnupg software-properties-common

# install
apt install -y apache2

#get start the apache server
systemctl start apache2

#get enable the apache server to run alway on starup
systemctl enable --now apache2

apt install -y php8.3 php8.3-cli php8.3-fpm libapache2-mod-php8.3

apt install -y php8.3-gd php8.3-xml php8.3-mbstring php8.3-zip php8.3-soap php8.3-curl php8.3-mysql php8.3-intl php8.3-bcmath php8.3-gettext

#expose the php packages information
echo "<?php phpinfo() ?>" >> /var/www/html/info.php

systemctl restart php8.3-fpm

systemctl restart apache2

php -m | grep -E 'phar|json|gd|dom|PDO|zip|gettext|soap|curl|iconv|ctype|fileinfo|xml|simplexml|mbstring|zlib|zmq'
