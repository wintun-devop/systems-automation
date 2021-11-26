#!/bin/bash

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

#http://www.mmuak.net or https://mmuak.blogspot.com/

# Update/Download package information from all configured sour
dnf -y upgrade

#collect mariadb package to local machine
curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup

#run default bash for mariadb version 10.6
bash mariadb_repo_setup --mariadb-server-version=10.6

#Installing necessary boot program for mariadb
dnf install boost-program-options -y

#reseting the module
dnf module reset mariadb -y

#Installing mariadb server and client packages
yum install -y MariaDB-server MariaDB-client MariaDB-backup

#get start the mariadb package
systemctl start mariadb

#get enable for start up register
systemctl enable --now mariadb

#mariadb final configuraltion(input your desired configuration data)
mariadb-secure-installation

