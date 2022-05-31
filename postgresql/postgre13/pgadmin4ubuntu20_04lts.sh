#!/bin/bash

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

#http://www.mmuak.net or https://mmuak.blogspot.com/

#Install the public key for the repository (if not done previously)
curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add

#Create the repository configuration file:
sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

#update the packages in repository
apt update -y 

#Install for web mode only: 
apt install -y pgadmin4-web 


#Configure the webserver, if you installed pgadmin4-web
/usr/pgadmin4/bin/setup-web.sh