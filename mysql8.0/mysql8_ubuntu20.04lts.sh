#!/bin/bash

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

#http://www.mmuak.net

#Necessary Update for system packages
echo "Updating the system packages ......................................................................................................."
apt update -y
echo "Packages update is done!!!!!!!!!!"

echo "Checking and upgrading packages if needed..........................................................................................."
apt upgrade -y
echo "Upgrade is done!!!!!!!!!!"

#MySQL 8.0 is included in the default Ubuntu repository for 20.04.Check available MySQL 8.0 packages.
echo "Checking mysql package on default repo......"
apt-cache pkgnames | grep mysql-server 

#necessary software packages for mysql server(wget,net-tools are optional)
echo "Installing mysql software packages................................................................................................."
apt-get install mysql-server-8.0 unzip wget make network-manager net-tools -y
echo "Necessary software packages installation done!"

#Get start database services
service mysql start

#Checking mysql status
echo "installation process is complete and mysql is workng now!"
service mysql status

#configure mysql initial configuration
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+++++++++++++++Mysql initial configuration going to start.Input desire settings+++++++++++++++"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
mysql_secure_installation