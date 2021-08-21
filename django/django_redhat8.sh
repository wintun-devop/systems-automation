#!/usr/bin/bash

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

#http://www.mmuak.net or https://mmuak.blogspot.com/


# Update/Download package information from all configured sources
dnf update -y

# Verify if Python3, curl and jq is installed
which python3 2>/dev/null || { dnf module -y install python39;}
which curl 2>/dev/null || { dnf install -y curl;}
which jq 2>/dev/null || { dnf install -y jq;}
which wget 2>/dev/null || { dnf install -y wget; }
which unzip 2>/dev/null || { dnf install -y unzip; }
which gcc 2>/dev/null || { dnf install -y gcc; }

#Installing python-devel and mysql-devel
dnf install -y mysql-common mysql-devel python3-devel

#installing django
pip3 install django

#installing necessary python database engine and connector
pip3 install pymysql pymssql pymongo


#install necessary mysql module
pip3 install mysqlclient
