#!/bin/bash

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

#http://www.mmuak.net or https://mmuak.blogspot.com/

# Update/Download package information from all configured sources
apt update -y

#Upgrading the downloaded packages
apt upgrade -y

#apache and necessary modules
apt install -y apache2 wget curl make unzip network-manager gcc net-tools lsb-release ca-certificates apt-transport-https gnupg software-properties-common

#get start the apache server
systemctl start apache2

#get enable the apache server to run alway on starup
systemctl enable --now apache2

#check ufw list(optional here)
ufw app list
ufw allow 'Apache'
ufw status

#php-8 modules
add-apt-repository ppa:ondrej/php -y

#Update package information from php8.0 configured sources
apt update -y 

#install php8.0 modules
apt install -y php8.0 libapache2-mod-php8.0

#installing php-extensions
apt install -y php8.0-{amqp,ast,bcmath,bz2,cgi,cli,common,curl,dba,dev,ds,enchant,fpm,gd,gmp,igbinary,imagick,imap,interbase,intl,ldap,mailparse,mbstring,memcached,msgpack,mysql,oauth,odbc,opcache,pgsql,phpdbg,pspell,psr,raphf,readline,redis,rrd,smbclient,snmp,soap,solr,sqlite3,sybase,tidy,uuid,xdebug,xhprof,xml,xsl,yac,yaml,zip,zmq}


#expose the php packages information
echo "<?php phpinfo() ?>" >> /var/www/html/info.php

#installing mysql client core for remote mysql database connection
apt install mysql-client-core-8.0 -y

#restarting apache server
systemctl restart apache2
