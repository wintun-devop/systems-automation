### Server Name Should Include
```
server {
    listen 80;
    server_name yourdomain.com;

    location / {
        proxy_pass http://localhost:5000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### Custom Config with SSL
```
server {
	listen 80;
	listen [::]:80;
    #Server Name required exctly
	server_name mmserver-test.com;
	
    #ssl enable or disable by admin
	#listen 443 ssl;
	#ssl_certificate /etc/nginx/certificates/your_rootca.crt;
	#ssl_certificate_key /etc/nginx/certificates/your_rootca.key;
	
	#server root setting by admin with next-js-typescript folder path(2)
	#root /home/ec2-user/site_name_new_v1;
	
	#Normal proxy pass location
	location / {
	# First attempt to serve request as file, then
	# as directory, then fall back to displaying a 404.
	#First attempt to serve request as file, then as directory, then fall back to displaying a 404.

	proxy_pass             http://localhost:5000;        
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

```
sudo setenforce 0
```
```
sudo systemctl restart nginx
```