#!/bin/bash

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

#http://www.mmuak.net or https://mmuak.blogspot.com/

# Update/Download package information from all configured sources
apt update -y

#Upgrading the downloaded packages
apt upgrade -y

#necessary and necessary modules(If this packages are already installed,place place # sing on start of command)
apt install -y curl make unzip network-manager gcc net-tools lsb-release ca-certificates apt-transport-https gnupg software-properties-common

#collect mariadb package to local machine
curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup

#run default bash for mariadb version 10.6
bash mariadb_repo_setup --mariadb-server-version=10.6

#update to repo packages
apt update -y

#Installing mariadb server and client packages
apt install -y mariadb-server mariadb-client

#get start the mariadb package
systemctl start mariadb

#get enable for start up register
systemctl enable --now mariadb

#mariadb final configuraltion(input your desired configuration data)
mariadb-secure-installation 
