#!/bin/bash
#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)
#http://www.mmuak.net or https://mmuak.blogspot.com/

# Update/Download package information from all configured sources
apt -y update

#Upgrading the downloaded packages
apt -y upgrade

#installing necessary libraries and packages for docker engine
apt install -y wget curl make unzip network-manager net-tools lsb-release ca-certificates apt-transport-https gnupg

#installing docker-ce engine
apt-get remove docker docker-engine docker.io containerd runc

#download and adding repo for docker-ce
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update/Download package information from all configured sources after adding docker repo
apt-get update -y

#installing docker-ce engine
apt-get install -y docker-ce docker-ce-cli containerd.io

#get enable the docker engine
systemctl enable --now docker

#checking the docker version
Docker_Version=$(docker --version)
echo "${Docker_Version} have been installed."

#vertify the docker
docker run hello-world

echo "Docker installation is complete and Docker compose installation will start in few seconds......"
sleep 5s

#Downloading docker-compose from github to /usr/local/bin
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

#change executable mode to docker-compose
chmod +x /usr/local/bin/docker-compose

#linking docker-compose to primary executable directory from local site
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

#Vertify the docker-compose version
dk_compose=$(docker-compose --version)
echo "${dk_compose} has been installed."
