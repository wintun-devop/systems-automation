### Mysql Download Page
```
https://dev.mysql.com/downloads/mysql/
```
### create uesr with all permission grant
```
CREATE USER 'dbadmin'@'%' IDENTIFIED BY 'YourPassword';
```
```
GRANT ALL ON *.* TO 'dbadmin'@'%';
```
```
FLUSH PRIVILEGES;
```
