#!/bin/bash

# Update/Download package information from all configured sources
dnf update -y 

#upgrdae the necessary packages
dnf upgrade -y

#installing apache and necessary modules
dnf install -y make gcc

#installing java21
dnf install -y java-21-amazon-corretto-jmods