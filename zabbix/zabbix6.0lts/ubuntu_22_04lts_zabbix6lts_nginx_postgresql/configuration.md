## https://www.zabbix.com/download?zabbix=6.0&os_distribution=ubuntu&os_version=22.04&components=server_frontend_agent&db=pgsql&ws=nginx
## zabbix configuration
### create database and database user on database host
```
sudo -u postgres createuser --pwprompt zabbix
```
```
sudo -u postgres createdb -O zabbix zabbix
```
### import schema
```
sudo zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix
```

## Configure the database for Zabbix server at /etc/zabbix/zabbix_server.conf
```
DBPassword=your_db_password
```
## Configure PHP for Zabbix frontend
- Edit file /etc/zabbix/nginx.conf uncomment and set 'listen' and 'server_name' directives.
```
# listen 8080;
# server_name example.com;
```


## ngnix proxy config
-- configuration name should be site name mysite.conf
```

```