#!/bin/bash

#Update/Download package information from all configured sources
sudo apt update -y

#Upgrading the downloaded packages
sudo apt upgrade -y

#installing necessary packages
sudo apt install -y wget curl make unzip network-manager gcc net-tools lsb-release ca-certificates apt-transport-https gnupg2 software-properties-common

#https://go.dev/doc/install
GO_LATEST_VERSION="go1.25.1.linux-amd64.tar.gz"

GO_LATEST_DOWNLOAD_LINK="https://go.dev/dl/$GO_LATEST_VERSION"

wget $GO_LATEST_DOWNLOAD_LINK

sudo rm -rf /usr/local/go 

sudo tar -C /usr/local -xzf $GO_LATEST_VERSION

export PATH=$PATH:/usr/local/go/bin

go version