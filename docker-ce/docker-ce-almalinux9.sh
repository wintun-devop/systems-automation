#!/bin/bash

# Update/Download package information from all configured sources
dnf update -y

#Remove the older docker common,engine and files
sudo dnf remove -y podman docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine container-selinux docker-selinux

#installing necessary libraries and packages for docker engine
dnf install -y lvm2 device-mapper device-mapper-persistent-data device-mapper-event device-mapper-libs device-mapper-event-libs net-tools curl wget unzip gcc make

#instaling  dnf-utils
dnf install -y dnf-utils

#download and adding repo for docker-ce via config-manager
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

#get start the docker engine
systemctl start docker

systemctl enable --now docker

#checking the docker version
Docker_Version=$(docker --version)
echo "${Docker_Version} have been installed."

#vertify the docker
docker run hello-world

echo "Docker installation is complete and Docker compose installation will start in few seconds......"

