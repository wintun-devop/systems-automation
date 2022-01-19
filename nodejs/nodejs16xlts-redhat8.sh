#!/bin/bash

#https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA (Please subscribe my channel.Thank You!)

#http://www.mmuak.net

#Necessary Update for system packages
echo "Updating the system packages ......................................................................................................."
dnf update -y
echo "Packages update is done!!!!!!!!!!"

#Installing necessary system packages before mysql package insalling
dnf install -y gcc gcc-c++ net-tools curl make wget unzip firewalld
echo "Necessary software packages installation done!"

#get start the firwalld 
systemctl start firewalld

#get enable firewalld for running at start up
systemctl enable --now firewalld

#adding necessary port for nodejs testing port
firewall-cmd --permanent --add-port=9000/tcp

#reload the firewalld
firewall-cmd --reload

#list the available nodejs modules
dnf module list nodejs

#enabling desire nodejs module
dnf -y module enable nodejs:16

#installing nodejs with development modules
dnf module install -y nodejs/development

#checking nodejs version
node --version
