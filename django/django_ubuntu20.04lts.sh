#!/usr/bin/bash

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

#http://www.mmuak.net or https://mmuak.blogspot.com/


# Update/Download package information from all configured sources
apt update -y

#Upgrading the downloaded packages
apt upgrade -y

# Verify if Python3, curl and jq is installed
which python3.9 2>/dev/null || { add-apt-repository ppa:deadsnakes/ppa -y && apt update -y && apt install -y python3.9;}
which curl 2>/dev/null || { apt install -y curl;}
which jq 2>/dev/null || { apt install -y jq;}
which wget 2>/dev/null || { apt install -y wget; }
which unzip 2>/dev/null || { apt install -y unzip; }
which gcc 2>/dev/null || { apt install -y gcc; }

#Installing python-devel,python3-pip and mysql-devel
apt-get install -y python3-dev default-libmysqlclient-dev build-essential python3-pip

#installing django
pip3 install django

#installing necessary python database engine and connector for mysql database
pip3 install pymysql pymssql pymongo virtualenv


#install necessary mysql client module
pip3 install mysqlclient
