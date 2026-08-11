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
- or
```
redis-cli ACL SETUSER myuser on >mypassword ~* +@all
```
