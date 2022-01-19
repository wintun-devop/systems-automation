#!/bin/bash

#https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA (Please subscribe my channel.Thank You!)

#http://www.mmuak.net or https://mmuak.blogspot.com/

# Update/Download package information from all configured sources
apt update -y

#Upgrading the downloaded packages
apt upgrade -y

#installing necessary modules before node-js
apt install -y wget curl make unzip network-manager gcc net-tools lsb-release ca-certificates apt-transport-https gnupg software-properties-common

#fatching repo for nodejs version 17.xxx
curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -

#installing nodejs
apt-get install -y nodejs

#check nodejs version
node --version