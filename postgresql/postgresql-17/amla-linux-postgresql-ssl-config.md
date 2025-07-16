### If using self-signed certificates
- self-signed certificate issue
```
openssl req -newkey rsa:4096 -nodes -keyout server_key.pem -x509 -days 365 -out server_cert.pem
```
- Copy key and certificate to /var/lib/pgsql/17/data/ location
```
sudo cp postgres_server_cert.pem  postgres_server_key.pem  /var/lib/pgsql/17/data/
```
- Configure Permsission for Certificate
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
- To Configure Fully Encrypt Traffic on postgresql
```
sudo vi /var/lib/pgsql/17/data/postgresql.conf
```
- update pg_hba.conf to
 - ssl = on
 - ssl_cert_file = 'postgres_server_cert.pem'
 - ssl_key_file = 'postgres_server_key.pem'
```
sudo vi /var/lib/pgsql/17/data/pg_hba.conf
```
```
hostssl all all 0.0.0.0/0 scram-sha-256
```
- Restart the db server
```
sudo systemctl restart postgresql-17
```



## If using actual valid certificate from aws,key need to be passphrase to unpassphrase
- copy certificate to server
- move certificates(yourdomain_key.pem,yourdomain_cert.pem)
```
sudo cp yourdomain_cert.pem  yourdomain_key.pem  /var/lib/pgsql/17/data/
```
- Configure Permsission for Certificate
```
sudo chown postgres:postgres  /var/lib/pgsql/17/data/yourdomain_cert.pem
```
```
sudo chmod 600  /var/lib/pgsql/17/data/yourdomain_cert.pem
```
```
sudo chown postgres:postgres  /var/lib/pgsql/17/data/yourdomain_key.pem
```
```
sudo chmod 600  /var/lib/pgsql/17/data/yourdomain_key.pem
```
- the key from aws certificate manager exported can not direct setup,need to unpassphrase
```
openssl rsa -in /var/lib/pgsql/17/data/yourdomain_key.pem -out /var/lib/pgsql/17/data/yourdomain_key_nopass.pem
```
```
sudo chown postgres:postgres  /var/lib/pgsql/17/data/yourdomain_key_nopass.pem
```
```
sudo chmod 600 /var/lib/pgsql/17/data/yourdomain_key_nopass.pem
```
- To Configure Fully Encrypt Traffic on postgresql
```
sudo vi /var/lib/pgsql/17/data/postgresql.conf
```
- update pg_hba.conf to
 - ssl = on
 - ssl_cert_file = 'yourdomain_cert.pem'
 - ssl_key_file = 'yourdomain_key_nopass.pem'
```
sudo vi /var/lib/pgsql/17/data/pg_hba.conf
```
```
hostssl all all 0.0.0.0/0 scram-sha-256
```
- Restart the db server
```
sudo systemctl restart postgresql-17
```

### Postgresql Connect with SSL Certificate
```
psql "host=db_host port=5432 dbname=db_name user=db_user sslmode=require"
```

### SSL Parameter Check Query
- The column that tells you if SSL is enabled (t) or disabled (f) for that session.
```
SELECT ssl FROM pg_stat_ssl WHERE pid = pg_backend_pid();
```

