#!/bin/bash

#Necessary Update for system packages
echo "Updating the system packages ......................................................................................................."
sudo dnf update -y
echo "Packages update is done!!!!!!!!!!"

sudo dnf list available 'postgresql17*'

sudo dnf install -y postgresql17 postgresql17-server postgresql17-contrib

/usr/bin/psql --version

sudo postgresql-setup --initdb

sudo systemctl enable --now postgresql

sudo systemctl status postgresql

