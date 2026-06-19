### Manager User Creation
```
CREATE USER 'admin'@'%' IDENTIFIED BY 'StrongPassword';
```
```
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;
```
```
FLUSH PRIVILEGES;
```
### network access
- from bind-address = 127.0.0.1 to bind-address = 0.0.0.0
```
sudo vi /etc/mysql/mariadb.conf.d/50-server.cnf
```
```
sudo systemctl restart mariadb
```
