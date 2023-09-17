#Update/Download package information from all configured sources
sudo apt update -y

#Upgrading the downloaded packages
sudo apt upgrade -y

#install necessary packages for prerequireties
sudo apt install -y wget curl make unzip network-manager gcc net-tools lsb-release ca-certificates apt-transport-https gnupg software-properties-common

#Import the GPG key:
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null

#add a repository for stable releases
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

# Updates the list of available packages
sudo apt-get update

# Installs the latest OSS release:
sudo apt-get install grafana

#Get start grafana-server services
sudo systemctl start grafana-server

#Get enable grafana services for start up register
sudo systemctl enable grafana-server

#enable port 3000 for grafana
sudo ufw allow 3000/tcp