#!/bin/bash

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

#http://www.mmuak.net

#Update/Download package information from all configured sources
apt -y update

#Upgrading the downloaded packages
apt -y upgrade

#installing necessary libraries and packages for docker engine
apt install -y wget curl make unzip network-manager net-tools lsb-release ca-certificates apt-transport-https gnupg

#Adding mongo repo to system
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -

echo "------------------------------------------------------------------------------------------------------------------------------------------------"
echo "Adding MongoDB 5.0 repo ..........................................."
echo "------------------------------------------------------------------------------------------------------------------------------------------------"
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" >>/etc/apt/sources.list.d/mongodb.list

echo "Update system packages for mango......................................................................................................."
apt update -y

#Installing mongo 
apt install -y mongodb-org 

#get start mongo
systemctl start mongod

#get enable mongo for running at start up
systemctl enable mongod