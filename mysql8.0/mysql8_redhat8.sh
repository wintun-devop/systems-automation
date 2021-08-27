#!/bin/bash

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

#http://www.mmuak.net

#Necessary Update for system packages
echo "Updating the system packages ......................................................................................................."
dnf update -y
echo "Packages update is done!!!!!!!!!!"

#Necessary repo installation for mysql8
echo "Installing mysql software packages................................................................................................."
dnf -y install https://dev.mysql.com/get/mysql80-community-release-el8-1.noarch.rpm

#necessary software packages for mysql server(wget,unzip and net-tools are optional)
dnf -y install mysql-server unzip wget make net-tools
echo "Necessary software packages installation done!"

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
