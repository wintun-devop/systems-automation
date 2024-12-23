#!/bin/bash

#update default packages
apt update -y

#upgrade initial packages
apt upgrade -y

#install necessary packages
apt install -y wget curl make unzip network-manager gcc net-tools lsb-release ca-certificates apt-transport-https gnupg software-properties-common

#open vpn key install
echo "deb [signed-by=/etc/apt/keyrings/openvpn-as.gpg.key] http://as-repository.openvpn.net/as/debian $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/openvpn-as.list

#certificate and gpg install
wget --quiet -O - https://as-repository.openvpn.net/as-repo-public.gpg | sudo tee /etc/apt/keyrings/openvpn-as.gpg.key

#openvpn repo update
apt update -y

#install open vpn
apt install -y openvpn-as