```
CREATE USER 'admin'@'%' IDENTIFIED BY 'StrongPassword';
```
```
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;
```
```
FLUSH PRIVILEGES;
```
