#!/bin/bash

#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwy

#Necessary Update for system packages
dnf update -y

#installing libreswan and necessary software packages 
dnf install libreswan net-tools firewalld -y

#Get start firewalld services
systemctl start firewalld

#Get enable firewalld services
systemctl enable firewalld

#add port 50 and 51 for ipsec
firewall-cmd --add-protocol={50,51} --permanent

#add port 4500 and 500 for udp in nat listing
firewall-cmd --add-port={4500,500}/udp --permanent

firewall-cmd --add-service=ipsec --permanent

#check the firewalld active zone status
firewall-cmd --get-active-zone

#Reloading the firewalld services
firewall-cmd --reload

#checking ip forwarding
sysctl net.ipv4.ip_forward

#checking /etc/sysctl.conf
cat /etc/sysctl.conf

#Erase the ip forwarding state
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.accept_redirects=0" >> /etc/sysctl.conf 
echo "net.ipv4.conf.all.send_redirects=0" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.rp_filter=0" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.accept_source_route=0" >> /etc/sysctl.conf

#Check the ip forwarding state
sysctl -p

#List he status on ipsec.d directory
ls /etc/ipsec.d/

#Get start ipsec services
systemctl start ipsec

#Get enable ipsec services
systemctl start ipsec