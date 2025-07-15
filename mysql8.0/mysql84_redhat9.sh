#!/bin/bash

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

#Necessary Update for system packages
echo "Updating the system packages ......................................................................................................."
dnf update -y
echo "Packages update is done!!!!!!!!!!"

#Installing necessary system packages before mysql package insalling
dnf install -y gcc net-tools curl wget unzip
echo "Necessary software packages installation done!"

#Downloading mysql communit reop
wget https://repo.mysql.com/https://repo.mysql.com/mysql84-community-release-el9-2.noarch.rpm
echo "mysql repo downloading complete."

#insalling mysql8 local repo
yum localinstall -y mysql84-community-release-el9-2.noarch.rpm
echo "mysql repo local installation complete."

#Verify MySQL Yum repository has been added successfully.
dnf repolist enabled | grep "mysql.*-community.*"

#Installing mysql server package
dnf install -y mysql-server

#Get start database services
systemctl start mysqld

#Get enable database services
echo "Getting enable mysql service................................................................................................."
systemctl enable mysqld

#configure mysql initial configuration
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+++++++++++++++Mysql initial configuration going to start.Input desire settings+++++++++++++++"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
mysql_secure_installation

#enable selinux permission
semanage port -a -t mysqld_port_t -p tcp 3306

#Restarting system
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+++++++++++++++All Configurations done and System going to reboot..............+++++++++++++++"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
reboot
