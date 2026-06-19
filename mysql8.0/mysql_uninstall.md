## Mysql Uninstall redhat
### Stop the MySQL Service
```
sudo systemctl stop mysqld
```
```
sudo dnf remove mysql-server mysql
```
### Delete Configuration and Data Files
```
dnf list installed | grep mysql
```
```
sudo rm -rf /var/lib/mysql
```
```
sudo rm -rf /etc/my.cnf /etc/mysql
```
### Remove MySQL User and Group (Optional)
```
sudo userdel mysql
```
```
sudo groupdel mysql
```
### Verify Removal
```
dnf list installed | grep mysql
```
```
sudo find / -iname '*mysql*'
```
## Mysql Uninstall ubuntu
```
sudo systemctl stop mysql
```
```
sudo systemctl disable mysql
```
```
sudo apt purge mysql-server mysql-client mysql-common mysql-server-core-* mysql-client-core-* -y
```
```
sudo apt purge mysql-server mysql-client mysql-community-server mysql-community-client \
mysql-community-common mysql-community-libs mysql-apt-config -y
```
```
sudo apt autoremove -y
```
```
sudo apt autoclean
```
