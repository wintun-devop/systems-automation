#!/bin/bash

# Update system packages
sudo apt update && sudo apt upgrade -y

# Install required dependencies
sudo apt install -y curl openssh-server ca-certificates tzdata perl

# Optional: Install Postfix for email notifications
sudo apt install -y postfix
# During setup, choose "Internet Site" and set your system mail name

# Add GitLab CE repository
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash

# Install GitLab CE (replace with your IP or domain)
sudo EXTERNAL_URL="http://192.168.1.100" apt install -y gitlab-ce

# Configure GitLab
sudo gitlab-ctl reconfigure

# Display initial root password
sudo cat /etc/gitlab/initial_root_password
