#!/bin/bash

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

#installing necessary repo
sudo rpm -i https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/pgadmin4-redhat-repo-2-1.noarch.rpm

# Install for web mode only.
sudo yum install pgadmin4-web

#run the web setup script to configure the system to run in web mode
sudo /usr/pgadmin4/bin/setup-web.sh
