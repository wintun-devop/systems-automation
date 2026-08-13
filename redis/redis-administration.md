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
- bind 0.0.0.0 
```
sudo vi /etc/redis/redis.conf
```
```
sudo systemctl restart redis
```
```
sudo netstat -tunlp
```
### Redis Setting
- check setting
```
CONFIG GET maxmemory
```
```
CONFIG GET bind
```
- set setting
```
CONFIG SET maxmemory 4gb
```
```
CONFIG REWRITE
```
### Server information
- Server info
```
INFO server
```
- Memory usage
```
INFO memory
```
- Replication status
```
INFO replication
```
- General statistics
```
INFO stats
```
- Database key counts
```
INFO keyspace
```
- Connected clients
```
INFO clients
```

