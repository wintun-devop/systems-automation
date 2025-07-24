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
