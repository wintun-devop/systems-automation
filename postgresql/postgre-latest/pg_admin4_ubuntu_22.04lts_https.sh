#!/bin/bash

#Update/Download package information from all configured sources
apt update -y

#Upgrading the downloaded packages
apt upgrade -y

#install necessary packages for prerequireties
apt install -y wget curl make unzip network-manager gcc net-tools lsb-release ca-certificates apt-transport-https gnupg software-properties-common

#Install the public key for the repository (if not done previously)
curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add

#Create the repository configuration file:
sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

#update the packages in repository
apt update -y 

#requier ufw allow
ufw allow http

ufw allow https


#Install for web mode only: 
apt install -y pgadmin4-web 


#Configure the webserver, if you installed pgadmin4-web
/usr/pgadmin4/bin/setup-web.sh

#enable 
a2enmod ssl

a2ensite default-ssl

systemctl restart apache2

