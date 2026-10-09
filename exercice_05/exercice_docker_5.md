# Exercice 5

```bash
docker network create reseau-mysql

docker volume create mysql-data

docker run -d --name mysql \
  --network reseau-mysql \
  --restart unless-stopped \
  -e MYSQL_ROOT_PASSWORD=rootpass \
  -e MYSQL_DATABASE=exercice05 \
  -e MYSQL_USER=nathan \
  -e MYSQL_PASSWORD=userpass \
  -v mysql-data:/var/lib/mysql \
  mysql:8

docker run -d --name adminer \
  --network reseau-mysql \
  --restart unless-stopped \
  -p 8080:8080 \
  adminer
  
docker rm -f mysql

docker run -d --name mysql \
  --network reseau-mysql \
  --restart unless-stopped \
  -e MYSQL_ROOT_PASSWORD=rootpass \
  -e MYSQL_DATABASE=exercice05 \
  -e MYSQL_USER=nathan \
  -e MYSQL_PASSWORD=userpass \
  -v mysql-data:/var/lib/mysql \
  mysql:8
  
docker kill mysql

docker ps
docker inspect -f '{{.RestartCount}}' mysql
```