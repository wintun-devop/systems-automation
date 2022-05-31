#!/bin/bash

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

#http://www.mmuak.net or https://mmuak.blogspot.com/

#Update/Download package information from all configured sources
apt update -y

#Upgrading the downloaded packages
apt upgrade -y

#install necessary packages for prerequireties
apt install -y wget curl make unzip network-manager gcc net-tools lsb-release ca-certificates apt-transport-https gnupg software-properties-common

#Create the file repository configuration:
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

#Import the repository signing key:
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

#Update the package lists
apt update -y

#Install the latest version of PostgreSQL.If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql'.Here,I go version 13.
apt install -y postgresql-13