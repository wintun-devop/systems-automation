#!/bin/bash

#https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA (Please subscribe my channel.Thank You!)

#http://www.mmuak.net or https://mmuak.blogspot.com/

#Necessary Update for system packages
echo "Updating the system packages ......................................................................................................."
dnf update -y
echo "Packages update is done!!!!!!!!!!"

#necessary software packages for nfs-server(wget,unzip and net-tools are optional)
dnf -y install curl nfs-utils unzip wget make net-tools
echo "Necessary software packages installation done!"

#Get enable database services
echo "Getting enable nsf-server service................................................................................................."
systemctl enable nfs-server

#desibling SELINUX module
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

#Restarting system
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "++++++++++All initial configurations is done and system going to reboot........+++++++++++++++"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
reboot

