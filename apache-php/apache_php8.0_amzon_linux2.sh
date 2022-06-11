#!/bin/bash

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

#http://www.mmuak.net or https://mmuak.blogspot.com/

# Update/Download package information from all configured sources
yum update -y 

#installing apache and necessary modules
yum install -y wget curl make unzip gcc net-tools httpd

#installing additional required repo for php8
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

#installing amazon-linux-extras command to enable the php8
yum install amazon-linux-extras


#enable php8 via amazon-linux-extras
amazon-linux-extras enable php8.0

#clean metadata before installing php8
yum clean metadata

#installing php8 major packages
yum install -y php

#installing php8 extension packages
yum install -y php-{cli,fpm,gd,intl,ldap,mbstring,mysqlnd,opcache,pdo,pear,pgsql,snmp,soap}

#get start the apache server
systemctl start httpd 

#get enable the apache server to run alway on starup
systemctl enable httpd

#expose the php packages information
echo "<?php phpinfo(); ?>" >> /var/www/html/info.php

#restarting apache server
systemctl restart httpd