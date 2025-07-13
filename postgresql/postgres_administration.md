### Access to Postgresql Database
```
sudo su - postgres
```
```
psql
```

### Create Database User
```
CREATE USER youruser WITH ENCRYPTED PASSWORD 'yourpass';
```
### Change database user permission
```
ALTER USER youruser WITH SUPERUSER;
```
```
ALTER USER youruser WITH CREATEDB;
```
```
ALTER USER youruser WITH REPLICATION;
```
```
ALTER USER youruser WITH createrole;
```
```
ALTER USER youruser WITH bypassrls;
```
### Database Create
```
CREATE DATABASE yourdbname;
```
```
GRANT ALL PRIVILEGES ON DATABASE yourdbname TO youruser;
```
test
## Check the Database Server Staus
- List Running Processes
```
ps aux | grep postgres
```
- Check Lising Port
```
netstat -tulnp | grep postgres
```
```
ss -tulnp | grep postgres
```
- Verify PostgreSQL Connection
```
sudo -u postgres psql -c "SELECT version();"
```
- Check the Service Type
```
sudo systemctl list-units --type=service | grep postgres
```
### Remote configuration for postgresql-17(redhat)
- uncomment listen_addresses = "*"
```
sudo vi /var/lib/pgsql/17/data/postgresql.conf
```
-add  "host all all 0.0.0.0/0  scram-sha-256" on following file
```
/var/lib/pgsql/17/data/pg_hba.conf
```
