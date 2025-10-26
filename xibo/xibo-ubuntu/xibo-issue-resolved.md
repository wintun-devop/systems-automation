### Xibo-CMS File Upload Limit Resolved
- update file size limit (if you are using php 8.4)
```
sudo vi /etc/php/8.4/apache2/php.ini
```
- increate size on 
  - upload_max_filesize = 50M
  - post_max_size = 50M
  - memory_limit = 128M   (increase if you plan many large uploads, set at least > post_max_size)

```
sudo systemctl restart php8.4-fpm
```
```
sudo systemctl restart apache2
```
