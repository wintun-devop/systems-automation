#!/bin/bash

#necessary core system update
dnf update -y

#installing libreswan and necessary software packages 
dnf install -y net-tools git curl wget unzip

#install dotnet8
dnf install -y dotnet-sdk-8.0