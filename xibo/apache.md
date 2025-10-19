### Remove Apache Package
```
sudo systemctl stop apache2
```
```
sudo apt-get remove --purge -y apache2 apache2-utils apache2-bin apache2-data
```
```
sudo apt-get autoremove --purge -y
```
```
sudo apt-get autoclean
```
###
```
sudo rm -rf /etc/apache2
```
- only if you want to delete all web content
```
sudo rm -rf /var/www/*       
```
```
sudo rm -rf /var/log/apache2
```
```
sudo rm -rf /usr/lib/apache2
```
```
sudo rm -f /usr/sbin/apache2
```
```
sudo rm -rf /usr/share/apache2
```