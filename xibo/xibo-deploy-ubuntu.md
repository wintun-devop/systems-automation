### Create Directory for Xibo
```
sudo mkdir /var/www/html/xibo
```
```
sudo tar -xzvf xibo-cms-4.3.1.tar.gz -C /var/www/html/xibo --strip-components=1
```
### Add Permission
```
sudo chown -R www-data:www-data /var/www/html/xibo
```
### Server Config for Regular Http
```
sudo vi /etc/apache2/sites-available/xibo.conf
```
```
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/xibo/web
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    <Directory /var/www/html/xibo/web>
         Options Indexes FollowSymLinks
         AllowOverride All
         Require all granted
   </Directory>
</VirtualHost>
```
```
sudo a2dissite 000-default.conf
```
```
sudo a2ensite xibo.conf
```
```
sudo a2enmod rewrite
```
```
sudo systemctl restart apache2
```

### enable ssl for https
```
sudo a2enmod ssl
```
```
sudo systemctl restart apache2
```
```
cat /etc/apache2/ports.conf
```
### configure ssl module
- /etc/apache2/sites-available/xibo-ssl.conf
```
<VirtualHost *:443>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/xibo/web

    SSLEngine on
    SSLCertificateFile      /path/to/my_cert.pem
    SSLCertificateKeyFile   /path/to/my_key.pem

    ErrorLog ${APACHE_LOG_DIR}/xibo-ssl-error.log
    CustomLog ${APACHE_LOG_DIR}/xibo-ssl-access.log combined

    <Directory /var/www/html/xibo/web>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```
```
sudo a2ensite xibo-ssl.conf
```
```
sudo systemctl reload apache2
```
- http to https redirect
```
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    RewriteEngine On
    RewriteRule ^ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]

    DocumentRoot /var/www/html/xibo/web
</VirtualHost>
```
```
sudo systemctl reload apache2
```

###
```
sudo mkdir /etc/apache2/certificates
```
```
sudo cp server_cert.pem server_key.pem /etc/apache2/certificates/
```


