#!/bin/bash

#Update/Download package information from all configured sources
sudo dnf update -y

#Upgrading the downloaded packages
sudo dnf upgrade -y

#installing necessary package
dnf install -y wget curl make unzip gcc net-tools tar

#https://go.dev/doc/install
GO_LATEST_VERSION="go1.25.1.linux-amd64.tar.gz"

GO_LATEST_DOWNLOAD_LINK="https://go.dev/dl/$GO_LATEST_VERSION"

wget $GO_LATEST_DOWNLOAD_LINK

sudo rm -rf /usr/local/go 

sudo tar -C /usr/local -xzf $GO_LATEST_VERSION

export PATH=$PATH:/usr/local/go/bin

go version
