#!/bin/bash

# Update/Download package information from all configured sources
sudo apt update -y

#Upgrading the downloaded packages
sudo apt upgrade -y

cd /tmp

curl -sS https://getcomposer.org/installer -o composer-setup.php

curl -sS https://getcomposer.org/installer.sig -o composer-setup.sig


# Install Composer Globally
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

rm composer-setup.php composer-setup.sig



