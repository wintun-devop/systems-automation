### wordpress
```
cd /var/www/html/
```
```
sudo mkdir /var/www/html/project-1
```
```
sudo chown -R www-data:www-data /var/www/html/project-1
```
```
sudo vi /etc/apache2/sites-available/project1.conf
```
```
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/project-1
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    <Directory /var/www/html/project-1>
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
sudo a2ensite project1.conf
```
```
sudo a2enmod rewrite
```
```
sudo systemctl restart apache2
```
