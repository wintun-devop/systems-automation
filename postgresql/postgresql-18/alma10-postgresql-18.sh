#!/bin/bash

# Update system packages
echo "Updating system packages..."
sudo dnf update -y
echo "System packages updated!"

# Install required tools
echo "Installing build tools..."
sudo dnf install -y gcc net-tools curl wget unzip git
echo "Tools installed!"

# Add PostgreSQL Yum repository for EL-10
echo "Adding PostgreSQL Yum repo..."
sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-10-x86_64/pgdg-redhat-repo-latest.noarch.rpm

# Disable built-in PostgreSQL module
echo "Disabling built-in PostgreSQL module..."
sudo dnf -qy module disable postgresql

# Install PostgreSQL 18 server
echo "Installing PostgreSQL 18..."
sudo dnf install -y postgresql18-server

# Initialize database
echo "Initializing PostgreSQL 18 database..."
sudo /usr/pgsql-18/bin/postgresql-18-setup initdb

# Enable and start PostgreSQL service
echo "Enabling and starting PostgreSQL 18..."
sudo systemctl enable postgresql-18
sudo systemctl start postgresql-18

echo "PostgreSQL 18 installation complete!"
