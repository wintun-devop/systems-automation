#!/bin/bash

# Update/Download package information from all configured sources
apt update -y

#Upgrading the downloaded packages
apt upgrade -y

#apache and necessary modules
apt install -y wget curl make unzip network-manager gcc gnupg net-tools lsb-release ca-certificates apt-transport-https gnupg software-properties-common

# install
apt install -y apache2

#get start the apache server
systemctl start apache2

#get enable the apache server to run alway on starup
systemctl enable --now apache2
