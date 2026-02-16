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
