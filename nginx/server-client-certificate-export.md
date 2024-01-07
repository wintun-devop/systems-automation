
## system configuration with ssl-auth-bypass
```
#ssl authenticatioon bypass by geo 
geo $verify {
  #site1-ip
  #1.1.1.1/24 "SUCCESS";
  
  #occ ip
  #123.0.0.0/16 "SUCCESS";
  
  #myanmar occ ip 
  #103.25.76.223/32 "SUCCESS";
  
}


server {
	listen 80;
	listen [::]:80;
	
	#point the certificate file path with for ssl certificates(valid ssl or self-signed ssl)
	#listen 443 ssl;
	#server_name myserver.com;
	#ssl_certificate /etc/nginx/certificates/myserver.crt;
	#ssl_certificate_key /etc/nginx/certificates/myserver.key;
	
	#server root setting by admin with next-js-typescript folder path(2)
    #server default paths
	#root /var/www/mysite/html;
    #custom applicatin path
	#root /home/ubuntu/site_name_new_v1;
	
	#ssl client certificate authention by admin(3-optional)
    #ssl client certificate(.crt or .pem) must be certificate file not key file
	#ssl_client_certificate   /etc/nginx/certificates/sitename_client.crt;
	#ssl_verify_client   optional;
	
	location / {
	# First attempt to serve request as file, then
	# as directory, then fall back to displaying a 404.
	#ssl client certification by pass with geo vertify by admin
	#ip block ssl by-pass byadmin
	
	    #if ( $verify = "SUCCESS"){
		#proxy_pass http://localhost:3000;
		#break;
		#}
		
	#client certificate request by admin
	
		#if ( $ssl_client_verify != SUCCESS) {
		#	return 403;
		#}		
	
	#proxy pass setting by admin
	#First attempt to serve request as file, then as directory, then fall back to displaying a 404.

        #proxy_pass             http://localhost:3000;        
		#proxy_read_timeout     60;
        #proxy_connect_timeout  60;
        #proxy_redirect         off;

        # Allow the use of websockets
        #proxy_http_version 1.1;
        #proxy_set_header Upgrade $http_upgrade;
        #proxy_set_header Connection 'upgrade';
        #proxy_set_header Host $host;
        #proxy_cache_bypass $http_upgrade;

		#origin 404 disable by proxy pass by admin
       	#try_files $uri $uri/ =404;
    }
}

```

### server
```
openssl req -newkey rsa:4096 -nodes -keyout server_key.pem -x509 -days 365 -out server_cert.pem
```


## client certificate not related with server
```
openssl req -x509 -newkey rsa:4096 -keyout client_key.pem -out client_cert.pem -days 365 -nodes
```
```
openssl pkcs12 -export -out client_user.p12 -inkey client_key.pem -in client_cert.pem
```

