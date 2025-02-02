#!/bin/bash

#Update/Download package information from all configured sources
sudo apt update -y

#Upgrading the downloaded packages
sudo apt upgrade -y

#install necessary packages for prerequireties
sudo apt install -y wget curl make unzip network-manager gcc net-tools lsb-release ca-certificates apt-transport-https gnupg2 software-properties-common

#install ngnix
sudo apt install nginx -y

sudo systemctl start nginx

sudo systemctl enable nginx
