#!/bin/sh

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

#https://wintun-edu.blogspot.com/

#Update/Download package information from all configured sources
sudo apt update -y

#Upgrading the downloaded packages
apt upgrade -y

#install necessary packages for prerequireties
apt install -y wget curl make unzip network-manager gcc net-tools lsb-release ca-certificates apt-transport-https gnupg2 software-properties-common

#install ngnix
apt install nginx -y

systemctl start nginx

systemctl enable nginx

ufw allow 80/tcp

ufw allow 443/tcp

ufw allow 8080/tcp

#install zabbix repo
wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-4+ubuntu22.04_all.deb
dpkg -i zabbix-release_6.0-4+ubuntu22.04_all.deb
apt update -y
apt upgrade -y

# Install zabbix
apt install -y zabbix-server-pgsql zabbix-frontend-php php8.1-pgsql zabbix-nginx-conf zabbix-sql-scripts zabbix-agent