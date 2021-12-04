#This script can install latest mysql community package on up string repo.

#!/bin/bash

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

#http://www.mmuak.net

#Necessary Update for system packages
echo "Updating the system packages ......................................................................................................."
dnf update -y
echo "Packages update is done!!!!!!!!!!"

#Installing necessary system packages before mysql package insalling
dnf install -y gcc net-tools curl wget unzip
echo "Necessary software packages installation done!"

#Downloading mysql communit reop
wget https://repo.mysql.com/mysql80-community-release-el8-1.noarch.rpm
echo "mysql repo downloading complete."

#insalling mysql8 local repo
yum localinstall -y mysql80-community-release-el8-1.noarch.rpm
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

#desibling SELINUX module
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

#configure mysql initial configuration
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+++++++++++++++Mysql initial configuration going to start.Input desire settings+++++++++++++++"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
mysql_secure_installation

#Restarting system
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+++++++++++++++All Configurations done and System going to reboot..............+++++++++++++++"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
reboot