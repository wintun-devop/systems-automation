###
```
sudo systemctl stop mysqld
```
```
sudo dnf remove mysql-server mysql
```
```
dnf list installed | grep mysql
```
```
sudo rm -rf /var/lib/mysql
```
```
sudo rm -rf /etc/my.cnf /etc/mysql
```
```
sudo userdel mysql
```
```
sudo groupdel mysql
```
