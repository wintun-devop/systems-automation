#!/bin/bash
#https://docs.aws.amazon.com/corretto/latest/corretto-21-ug/generic-linux-install.html

apt update -y && apt upgrade -y

apt install wget curl make unzip network-manager gcc net-tools lsb-release ca-certificates apt-transport-https gnupg software-properties-common -y

sudo apt install openjdk-21-jdk -y