#!/bin/bash

# Update/Download package information from all configured sources
dnf update -y

#Remove the older docker common,engine and files
dnf remove -y docker-common docker container-selinux docker-selinux docker-engine

#installing necessary libraries and packages for docker engine
dnf install -y lvm2 device-mapper device-mapper-persistent-data device-mapper-event device-mapper-libs device-mapper-event-libs net-tools curl wget unzip

#instaling  dnf-utils
dnf install -y dnf-utils

#download and adding repo for docker-ce via config-manager
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin --allowerasing

#get start the docker engine
systemctl start docker

systemctl enable --now docker

#checking the docker version
Docker_Version=$(docker --version)
echo "${Docker_Version} have been installed."

#vertify the docker
docker run hello-world

echo "Docker installation is complete and Docker compose installation will start in few seconds......"
sleep 5s

#Downloading docker-compose from github to /usr/local/bin
curl -L "https://github.com/docker/compose/releases/download/v2.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

#linking docker-compose to primary executable directory from local site
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

#Vertify the docker-compose version
dk_compose=$(docker-compose --version)
echo "${dk_compose} has been installed."
