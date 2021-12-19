#!/bin/bash

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

#http://www.mmuak.net

#Necessary Update for system packages
echo "Updating the system packages ......................................................................................................."
dnf update -y
echo "Packages update is done!!!!!!!!!!"

#Installing necessary system packages before mysql package insalling
dnf install -y gcc net-tools curl wget unzip firewalld
echo "Necessary software packages installation done!"

#get start the firwalld 
systemctl start firewalld

#get enable firewalld for running at start up
systemctl enable --now firewalld

#make inclusive for mongo port
firewall-cmd --add-port=27017/tcp --permanent

#reload the firewalld
firewall-cmd --reload

#Adding mongo repo to system
echo "------------------------------------------------------------------------------------------------------------------------------------------------"
echo "Adding MongoDB 5.0 repo ..........................................."
echo "------------------------------------------------------------------------------------------------------------------------------------------------"
echo "[mongodb-org-5.0]" >>/etc/yum.repos.d/mongodb-org-5.0.repo
echo "name=MongoDB Repository" >>/etc/yum.repos.d/mongodb-org-5.0.repo
echo "baseurl=https://repo.mongodb.org/yum/redhat/\$releasever/mongodb-org/5.0/x86_64/" >>/etc/yum.repos.d/mongodb-org-5.0.repo
echo "gpgcheck=1" >>/etc/yum.repos.d/mongodb-org-5.0.repo
echo "enabled=1" >>/etc/yum.repos.d/mongodb-org-5.0.repo
echo "gpgkey=https://www.mongodb.org/static/pgp/server-5.0.asc" >>/etc/yum.repos.d/mongodb-org-5.0.repo

echo "Update system packages for mango......................................................................................................."
dnf update -y


#Installing mongo 
dnf install -y mongodb-org

#get start mongo
systemctl start mongod

#get enable mongo for running at start up
systemctl enable mongod