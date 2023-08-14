# Update/Download package information from all configured sources
dnf update -y 

#upgrdae the necessary packages
dnf upgrade -y

#installing apache and necessary modules
dnf install -y make gcc

#nginx installation
dnf install nginx -y

#
systemctl start nginx

#
systemctl enable nginx