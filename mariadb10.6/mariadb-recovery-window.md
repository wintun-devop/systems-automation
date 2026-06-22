- Keep that window open. 
```
cd \xampp\mysql\bin
```
```
mysqld.exe --defaults-file="D:\xampp\mysql\bin\my.ini" --skip-grant-tables --console
```

- Then open a second CMD window.On another cmd window
```
cd \xampp\mysql\bin
```
```
FLUSH PRIVILEGES;
```
```
ALTER USER 'root'@'localhost' IDENTIFIED BY '';
```
```
CREATE USER IF NOT EXISTS 'dbadmin'@'%' IDENTIFIED BY 'NewStrongPassword';
```
```
GRANT ALL PRIVILEGES ON *.* TO 'dbadmin'@'localhost' WITH GRANT OPTION;
```
```
FLUSH PRIVILEGES;
```
```
EXIT;
```
