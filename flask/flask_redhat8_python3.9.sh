#!/usr/bin/bash

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

#http://www.mmuak.net or https://mmuak.blogspot.com/


# Update/Download package information from all configured sources
dnf update -y

# Verify if Python3, other necessary packages is installed
which python3 2>/dev/null || { dnf module -y install python39;}
which curl 2>/dev/null || { dnf install -y curl;}
which jq 2>/dev/null || { dnf install -y jq;}
which wget 2>/dev/null || { dnf install -y wget; }
which unzip 2>/dev/null || { dnf install -y unzip; }
which gcc 2>/dev/null || { dnf install -y gcc; }
which net-tools 2>/dev/null || { dnf install -y net-tools; }
which network-manager 2>/dev/null || { dnf install -y network-manager; }

#Installing python-devel and mysql-devel
dnf install -y mysql-common mysql-devel python3-devel

#installing virtual environment
pip3 install virtualenv

#installing necessary python database engine and connector
pip3 install pymysql pymssql pymongo mysql-connector mysql-connector-python


#install necessary mysql module
pip3 install mysqlclient

#installing flask-sqlalchemy module and additional flask modules
pip3 install flask flask-sqlalchemy flask-wtf cryptography Flask-Migrate

