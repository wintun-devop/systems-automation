#!/bin/bash

#Update/Download package information from all configured sources
apt update -y

#Upgrading the downloaded packages
apt upgrade -y

#install necessary packages for prerequireties
apt install -y wget curl make unzip network-manager gcc net-tools lsb-release ca-certificates apt-transport-https gnupg2 software-properties-common

#dotnet dependencies packages
apt install -y zlib1g libunwind8 libstdc++6 libssl3 liblttng-ust1 libicu74 libgcc-s1 libc6

#install dotnet8 runtime
apt-get install -y dotnet-sdk-8.0