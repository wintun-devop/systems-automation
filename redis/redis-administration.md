### Before the Redis6+
```
```
### After the Redis6+
```
redis-cli
```
- ~* → access to all keys
- +@all → all Redis commands
```
ACL SETUSER myuser on >mypassword ~* +@all
```
```
ACL SETUSER redisadmin on >UIFksuf234#$ ~* +@all
```
- or
```
redis-cli ACL SETUSER myuser on >mypassword ~* +@all
```

### connect with username and password
```
redis-cli --user myuser --pass mypassword
```
```
redis-cli -u redis://myuser:mypassword@127.0.0.1:6379
```
```
ACL LIST
```
### Remote config
```
sudo cp /etc/redis/redis.conf /etc/redis/redis.conf.bk
```
```
sudo vi /etc/redis/redis.conf
```
