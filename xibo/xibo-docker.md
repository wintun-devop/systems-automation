### Xibo with Docker 

```
docker network cerate dev-net-1
```
- mysql
```
docker run --name dev-mysql-8-4-6 --network dev-net-1 -e MYSQL_ROOT_PASSWORD=Abc123Abc123 -p 3307:3306 -v D:\docker_volumes\mysql846-data:/var/lib/mysql -d mysql:8.4.6
```
- xibo running on docker desktop(window-cmd)
```
docker run -d --name xibo-cms --network dev-net-1 --restart unless-stopped ^
  -p 8080:80 ^
  -e MYSQL_HOST=dev-mysql-8-4-6  ^
  -e MYSQL_PORT=3306 ^
  -e MYSQL_DATABASE=xibo_docker ^
  -e MYSQL_USER=your_db_user ^
  -e MYSQL_PASSWORD="your_db_password" ^
  -e CMS_SERVER_NAME="http://localhost:8080" ^
  -v "D:/docker_volumes/xibo/library:/var/www/cms/library" ^
  -v "D:/docker_volumes/xibo/custom:/var/www/cms/custom" ^
  ghcr.io/xibosignage/xibo-cms:release-4.3.1
```


