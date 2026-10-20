#!/bin/bash

#Necessary Update for system packages
echo "Updating the system packages ......................................................................................................."
dnf update -y
echo "Packages update is done!!!!!!!!!!"

sudo dnf list available 'postgresql17*'

sudo dnf install -y postgresql17 postgresql17-server postgresql17-contrib
