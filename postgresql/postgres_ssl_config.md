### self-signed certificate 
```
openssl req -newkey rsa:4096 -nodes -keyout server_key.pem -x509 -days 365 -out server_cert.pem
```

### To Fully Encrypt Traffic on postgresql
- Enable SSL in postgresql.conf
  - ssl = on
  - ssl_cert_file = 'server.crt'
  - ssl_key_file = 'server.key'
```  
sudo vi /var/lib/pgsql/17/data/postgresql.conf
```
- update pg_hba.conf to
```
/var/lib/pgsql/17/data/pg_hba.conf
```
- add
```
hostssl all all 0.0.0.0/0 scram-sha-256
```
### Adjust Certificate Permission
```
sudo chown postgres:postgres  /var/lib/pgsql/17/data/db_server_cert.pem
```
```
sudo chmod 600  /var/lib/pgsql/17/data/db_server_cert.pem
```
```
sudo chown postgres:postgres  /var/lib/pgsql/17/data/db_server_key.pem
```
```
sudo chmod 600  /var/lib/pgsql/17/data/db_server_cert_key.pem
```
### SSL Parameter
```
SELECT ssl FROM pg_stat_ssl WHERE pid = pg_backend_pid();
```

