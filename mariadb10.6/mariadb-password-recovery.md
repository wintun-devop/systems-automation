### Mariadb - Password Recovery
- In case of need to recover MariaDB root acces
```
sudo systemctl stop mariadb
```
```
sudo mysqld_safe --skip-grant-tables --skip-networking &
```
```
mysql -u root
```

- Inside of MariaDB:
```
FLUSH PRIVILEGES;
```
```
ALTER USER 'root'@'localhost' IDENTIFIED VIA unix_socket;
```
```
CREATE USER IF NOT EXISTS 'dbadmin'@'localhost' IDENTIFIED BY 'NEW_STRONG_PASSWORD';
```
```
GRANT ALL PRIVILEGES ON *.* TO 'dbadmin'@'localhost' WITH GRANT OPTION;
```
```
FLUSH PRIVILEGES;
```
- Restart normally:
```
sudo pkill mysqld
```
```
sudo systemctl start mariadb
```
```
sudo mysql
```
```
mysql -u dbadmin -p
```

