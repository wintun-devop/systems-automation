### Set Hostname
```
sudo hostnamectl set-hostname YOUR_DESIRED_HOSTNAME
```
### Check Specific Port Running
```
netstat -tulpn | grep :8443
```
### Kill Speciic Port If necessary
```
sudo fuser -k 8443/tcp
```
