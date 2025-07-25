#!/bin/bash

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

# Update/Download package information from all configured sources
dnf update -y 

#upgrdae the necessary packages
dnf upgrade -y

#installing apache and necessary modules
dnf install -y wget curl make unzip gcc net-tools httpd httpd-devel

dnf install httpd -y

systemctl enable --now httpd

#installing additional required repo for php8
dnf install -y https://rpms.remirepo.net/enterprise/remi-release-9.rpm 

dnf module reset php -y

#listing php packages
echo "listing the php module ................................................................................................."
dnf module list php

#enabling php8 stream
echo "enabling the php8 module ................................................................................................."
dnf module enable php:remi-8.4 -y

#listing php packages
echo "listing the php module after php8 enabling ................................................................................"
dnf module list php

#installing php8 major packages
echo "Installing php8 major packages ..........................................................................................."
dnf install -y php

#installing php8 extension packages
echo "Installing php extension packages ........................................................................................"
dnf -y install php-{common,opcache,cli,gd,curl,mysqlnd,devel,pear,snmp,odbc,pgsql,mbstring,xml,soap,zip}

#get start the apache server
systemctl start httpd 

#get enable the apache server to run alway on starup
systemctl enable httpd

#expose the php packages information
echo "<?php phpinfo(); ?>" >> /var/www/html/info.php

#restarting apache server
systemctl restart httpd
