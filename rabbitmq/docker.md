### pull docker image
```
docker pull rabbitmq:4-management
```
### start docker contaianer
```
docker run -d --name rabbitmq --network mynet-1 -p 5672:5672 -p 15672:15672 rabbitmq:4-management
```