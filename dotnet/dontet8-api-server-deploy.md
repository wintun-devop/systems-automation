### dotnet-ef package for migration
```
dotnet tool install --global dotnet-ef
```
### Database Migrate and Upgrad (for single database) - only database model change or initial deploy
```
dotnet ef database update
```
### Database Migrate and Upgrad (for one more database) - only database model change or initial deploy
```
dotnet ef database update --context AppDB1
```
```
dotnet ef database update --context AppDb2
```
### Run Program (for development mode only)
```
dotnet run
```
### Production Release for Production
```
dotnet publish -c Release --self-contained true /p:PublishSingleFile=true /p:EnableCompressionInSingleFile=true /p:TrimUnusedDependencies=true
```
### Service Create For Production
```
sudo vi /etc/systemd/system/mysite.service
```
### Reload the system demon
``` 
sudo systemctl daemon-reload
```
### Enable the system demon to initialize smt.service
```
sudo systemctl enable mysite.service
```
### Start the system demon for smt.service
```
sudo systemctl start mysite.service
```
### Check the system demon for smt.service
```
sudo systemctl status mysite.service
```

### Nginx Configuration (for initial deployment)
```
unlink /etc/nginx/sites-enabled/default
```
```
cd /etc/nginx/sites-available/
```
### copy nginx sample-nginx.conf here
```
vi mysite.conf
```
```
ln -s /etc/nginx/sites-available/mysite.conf  /etc/nginx/sites-enable/
```
```
systemctl restart nginx
```