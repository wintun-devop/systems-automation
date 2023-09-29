#!/bin/bash
#Win Tun Hlaing(https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA)
#https://grafana.com/docs/grafana/latest/setup-grafana/installation/redhat-rhel-fedora/
#Necessary Update for system packages
dnf update -y

#installing libreswan and necessary software packages 
dnf install net-tools firewalld curl wget unzip -y

#Get start firewalld services
systemctl start firewalld

#Get enable firewalld services
systemctl enable firewalld

#add port 80 and 443 for ipsec
firewall-cmd --add-port={80,443,3000}/tcp --permanent

#grafana section
wget -q -O gpg.key https://rpm.grafana.com/gpg.key
rpm --import gpg.key

#create grafana repo
touch /etc/yum.repos.d/grafana.repo

#import report data
echo "[grafana]" >> /etc/yum.repos.d/grafana.repo
echo "name=grafana" >> /etc/yum.repos.d/grafana.repo
echo "baseurl=https://rpm.grafana.com" >> /etc/yum.repos.d/grafana.repo
echo "repo_gpgcheck=1" >> /etc/yum.repos.d/grafana.repo
echo "enabled=1" >> /etc/yum.repos.d/grafana.repo
echo "gpgcheck=1" >> /etc/yum.repos.d/grafana.repo
echo "gpgkey=https://rpm.grafana.com/gpg.key" >> /etc/yum.repos.d/grafana.repo
echo "sslverify=1" >> /etc/yum.repos.d/grafana.repo
echo "sslcacert=/etc/pki/tls/certs/ca-bundle.crt" >> /etc/yum.repos.d/grafana.repo
echo "exclude=*beta*" >> /etc/yum.repos.d/grafana.repo

#Update the grafana packages
dnf update -y

#Grafana OSS installation
dnf install grafana -y

#Get start grafana-server services
systemctl start grafana-server

#Get enable grafana services for start up register
systemctl enable grafana-server