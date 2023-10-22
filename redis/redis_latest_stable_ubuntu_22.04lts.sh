#!/bin/bash

#update default packages
sudo apt update -y

#upgrade initial packages
sudo apt upgrade -y

#install necessary packages
sudo apt install -y wget curl make unzip network-manager gcc net-tools lsb-release ca-certificates apt-transport-https gnupg software-properties-common gpg

# Create the file repository configuration:
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg

#Import the repository signing key:
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list

#Update the package lists:
sudo apt-get update -y

#install the redis
sudo apt-get install redis -y