### smb package installation
```
sudo dnf update -y
```
```
sudo dnf install -y samba samba-common samba-client
```

### smb dir creation
```
sudo mkdir -p /srv/samba/shared
```

### smbuser and group configuration
```
sudo groupadd smbgroup
```
```
sudo useradd -M -s /sbin/nologin -G smbgroup smbuser
```
```
sudo smbpasswd -a smbuser
```
```
sudo smbpasswd -e smbuser
```
```
sudo chown -R smbuser:smbgroup /srv/samba/shared
```
```
sudo chmod 770 /srv/samba/shared
```


### smb configuration
```
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
```
- sudo nano /etc/samba/smb.conf
```
sudo vi /etc/samba/smb.conf
```
```
[global]
        workgroup = WORKGROUP
        server string = Samba File Server on AlmaLinux
        netbios name = ALMASERVER
        security = user
        passdb backend = tdbsam
```
```
[Shared]
        comment = Secure Shared Documents
        path = /srv/samba/shared
        valid users = @smbgroup
        guest ok = no
        writable = yes
        browsable = yes
```
### firewall setting
```
sudo dnf install -y policycoreutils-python-utils
```
```
sudo semanage fcontext -a -t samba_share_t "/srv/samba(/.*)?"
```
```
sudo restorecon -Rv /srv/samba/
```
```
sudo firewall-cmd --add-service=samba --permanent
```
```
sudo firewall-cmd --reload
```
```
sudo systemctl enable --now nmb
```
```
sudo systemctl status nmb
```
