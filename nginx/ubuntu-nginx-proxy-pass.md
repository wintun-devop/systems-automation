### Nginx Proxy Pass on Ubuntu
```
unlink /etc/nginx/sites-enabled/default
```
```
cd /etc/nginx/sites-available/
```
```
vi your_site_name.conf
```
```
ln -s /etc/nginx/sites-available/your_site_name.conf  /etc/nginx/sites-enable/
```
```
systemctl restart nginx
```
### your_site_name.conf setting with proxy buffer enable
```
server {
	listen 80;
	listen [::]:80;
	
	#ssl enable or disable by admin
	#listen 443 ssl;
	#server_name mmserver-test.com;
	#ssl_certificate /etc/nginx/certificates/your_rootca.crt;
	#ssl_certificate_key /etc/nginx/certificates/your_rootca.key;
	
	#server root setting by admin with next-js-typescript folder path(2)
	#root /home/ec2-user/site_name_new_v1;
	

	#Normal proxy pass location
	location / {
	# First attempt to serve request as file, then
	# as directory, then fall back to displaying a 404.
	#First attempt to serve request as file, then as directory, then fall back to displaying a 404.

	proxy_pass             http://localhost:3000;        
	proxy_read_timeout     60;
	proxy_connect_timeout  60;
	proxy_redirect         off;
	proxy_buffers 8 16k;
	proxy_buffer_size 32k;

        # Allow the use of websockets
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;

	#origin 404 disable by proxy pass by admin
    	#try_files $uri $uri/ =404;
    }
}
```
### Self-Signed Certificate SSL
```
openssl req -newkey rsa:4096 -nodes -keyout server_key.pem -x509 -days 365 -out server_cert.pem
```

### pm2 for nodejs application
```
pm2 start npm --name app1 -- run start -- -p 3000
```
