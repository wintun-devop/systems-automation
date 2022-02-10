#!/usr/bin/bash

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

#http://www.mmuak.net or https://mmuak.blogspot.com/

#create virtual environment for your flask project
virtualenv flaskproject01

#change the director to flask project
cd flaskproject01

#activate the flask project
source bin/activate

#Upgrading the pip
python3 -m pip install --upgrade pip

#installing necessary python database engine and connector for mysql database
pip3 install pymysql pymongo mysql-connector mysql-connector-python mysqlclient

#Installing flask and additional module for virtual environment
pip3 install flask flask-sqlalchemy flask-wtf cryptography Flask-Migrate


