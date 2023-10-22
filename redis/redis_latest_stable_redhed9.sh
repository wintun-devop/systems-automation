#!/bin/bash

# Update/Download package information from all configured sources
dnf update -y 

#upgrdae the necessary packages
dnf upgrade -y

#installing apache and necessary modules
dnf install -y wget curl make unzip gcc net-tools

#
dnf search redis

#install redis
dnf install redis -y

#
systemctl start redis

#
systemctl enable redis