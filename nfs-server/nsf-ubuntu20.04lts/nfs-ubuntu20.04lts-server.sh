#!/bin/bash

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

#http://www.mmuak.net or https://mmuak.blogspot.com/

# Update/Download package information from all configured sources
apt update -y

#Upgrading the downloaded packages
apt upgrade -y

#installing necessary packages and nsf server module
apt install -y wget curl make unzip network-manager gcc net-tools nfs-kernel-server

systemctl enable --now nfs-server