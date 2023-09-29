#!/bin/sh

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA/videos)

#http://www.mmuak.net or https://mmuak.blogspot.com/


#Necessary Update for system
dnf update -y

#Necessary Package installation for PHP front-end and apache web server
dnf install -y httpd php php-cli php-common php-mbstring php-mysqlnd php-xml php-bcmath php-devel php-pear php-gd

#Get start web server services
systemctl start httpd

#Get enable web server services
systemctl enable httpd

#Importing zabbix repo
rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/8/x86_64/zabbix-release-5.0-1.el8.noarch.rpm

#Installing zabbix installer packages and database(mariadb) connector for web server.
dnf install -y zabbix-server-mysql zabbix-web-mysql zabbix-agent zabbix-apache-conf mariadb

#desibling SELINUX module
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

#get start zabbix server and php front-end module
systemctl start zabbix-server zabbix-agent php-fpm httpd

#get enable zabbix server and php front-end module
systemctl start zabbix-server zabbix-agent php-fpm httpd

#Restarting system
reboot
#END