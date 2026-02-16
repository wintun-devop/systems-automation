### Deploy Process
- deliver your latest code
```
sudo mkdir -p /opt/your-apps
```
```
cd /opt/
```
```
sudo chown -R $(whoami):$(whoami) your-apps
```
### Database Creation for dmz(first time only)
```
psql -h server_ip -U db_user -d postgres
```
```
create database your_database;
```
- deliver MyNextJSApp latest code to server home user directory
```
mv MyNextJSApp /opt/your-apps/
```
```
ls -la /opt/your-apps/
```
- deliver node_modules.tgz to server home user directory
```
mv node_modules.tgz  /opt/your-apps/MyNextJSApp/
```
```
cd /opt/your-apps/MyNextJSApp/
```
```
tar -xzf node_modules.tgz
```
- env preparation
```
sudo vi .env
```
```
# Database
DATABASE_URL="postgresql://your_db_username:your_db_password@your_host_ip:5432/myapp_db?schema=public"

# Session
SESSION_SECRET="your-session-secret-change-in-production"
SESSION_TIMEOUT_MINUTES=30

# Environment
NODE_ENV="production"

# NextAuth Url
NEXTAUTH_URL=http://192.168.1.41
# NEXTAUTH_URL_INTERNAL=http://localhost:3000
```
- 
```
npx prisma migrate dev
```
```
npx prisma db seed
```
```
npm run build
```

### Service Creation
```
sudo restorecon -Rv /usr/local/nodejs
```
```
sudo vi /etc/systemd/system/your-app.service
```
```
[Unit]
Description=YourAppNextJSApplication
After=network.target

[Service]
Type=simple
User=sysadmin
WorkingDirectory=/opt/your-apps/MyNextJSApp
ExecStart=/usr/local/nodejs/bin/node /opt/your-apps/MyNextJSApp/node_modules/next/dist/bin/next start -p 3000 -H 0.0.0.0
Restart=on-failure
RestartSec=5
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
```
```
sudo systemctl daemon-reload
```
```
sudo systemctl enable your-app.service
```
```
sudo systemctl start your-app.service
```
```
sudo systemctl status your-app.service
```
### Nginx Config
```
cd /etc/nginx/conf.d/
```
```
sudo vi yourapp.conf
```
```
server {
    listen 80;
    server_name _;
	#ssl settings(if we want to use ssl ,uncomment below)
	#listen 443 ssl;
	#ssl_certificate /etc/nginx/certificates/sitename_rootca.crt;
	#ssl_certificate_key /etc/nginx/certificates/sitename_rootca.key;
	

    location / {
        proxy_pass http://127.0.0.1:3000/;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_cache_bypass $http_upgrade;
    }
}
```
```
sudo systemctl restart nginx
```
