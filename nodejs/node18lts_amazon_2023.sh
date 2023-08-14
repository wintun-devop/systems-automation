#!/bin/bash

# Update/Download package information from all configured sources
apt update -y

#Upgrading the downloaded packages
apt upgrade -y

#
curl -sL https://rpm.nodesource.com/setup_18.x | sudo -E bash - 

#
dnf install -y nodejs

# 
node --version