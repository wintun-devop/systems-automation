#!/bin/sh

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

#https://wintun-edu.blogspot.com/

#Update/Download package information from all configured sources
sudo apt update -y

#Upgrading the downloaded packages
sudo apt upgrade -y

#install necessary packages for prerequireties
sudo apt install -y wget curl make unzip network-manager gcc net-tools lsb-release ca-certificates apt-transport-https gnupg software-properties-common

#zabbix

