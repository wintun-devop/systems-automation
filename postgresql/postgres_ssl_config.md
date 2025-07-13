### self-signed certificate 
```
openssl req -newkey rsa:4096 -nodes -keyout server_key.pem -x509 -days 365 -out server_cert.pem
```
