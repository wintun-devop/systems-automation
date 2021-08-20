#!/bin/bash

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

#http://www.mmuak.net

#Necessary Update for system packages
dnf update -y 

#Necessary repo installation for mysql8
dnf -y install https://dev.mysql.com/get/mysql80-community-release-el8-1.noarch.rpm

#necessary software packages for mysql server(workbench,wget,net-tools are optional)
dnf -y install mysql-server unzip wget make net-tools

#Get start database services
systemctl start mysqld

#Get enable database services
systemctl enable mysqld

#desibling SELINUX module
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

#configure mysql initial configuration
mysql_secure_installation

#Restarting system
reboot