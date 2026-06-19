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
### delete data dir
```
sudo rm -rf /var/lib/mysql
```
```
sudo rm -rf /var/lib/mysql-files
```
```
sudo rm -rf /var/lib/mysql-keyring
```
### delete configuration file
```
sudo rm -rf /etc/mysql
```
```
sudo find /etc -name "mysql*" 2>/dev/null
```
### Remove log files
```
sudo rm -rf /var/log/mysql
```
```
sudo deluser mysql
```
```
sudo delgroup mysql
```
### Remove repository configuration (if added)
```
sudo rm -f /etc/apt/sources.list.d/mysql.list
```
```
sudo rm -f /etc/apt/trusted.gpg.d/mysql.gpg
```
```
sudo apt update
```
### Remove PID and socket files
```
sudo rm -f /var/run/mysqld/mysqld.pid
```
```
sudo rm -f /var/run/mysqld/mysqld.sock
```
```
sudo rm -rf /var/run/mysqld
```
### Verify complete removal
```
ps aux | grep -i mysql
```
```
dpkg -l | grep -i mysql
```
```
sudo ss -tlnp | grep 3306
```
