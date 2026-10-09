# Exercice 08

```bash
docker network create kennel-net

docker run -d --name kennel-mysql \
  --network kennel-net \
  -e MYSQL_ROOT_PASSWORD=rootpass \
  -e MYSQL_DATABASE=kennel \
  -e MYSQL_USER=kennel \
  -e MYSQL_PASSWORD=kennelpass \
  -v kennel-data:/var/lib/mysql \
  -p 3306:3306 \
  mysql:8
```

```bash
mvn spring-boot:run
```

```bash
docker build -t kennel-api .

docker run -d --name kennel-api \
  --network kennel-net \
  -p 8080:8080 \
  -e DB_URL=jdbc:mysql://kennel-mysql:3306/kennel \
  kennel-api
```

```bash
docker logs -f kennel-api
```

```bash
docker rm -f kennel-api kennel-mysql
docker network rm kennel-net
```

```bash
docker compose up -d --build
docker compose logs -f api
docker compose down        
docker compose down -v     
```

```bash
# Create
curl -X POST http://localhost:8080/api/v1/dogs \
  -H "Content-Type: application/json" \
  -d '{"name":"Rex","birthDate":"2019-06-15","breed":"Berger allemand","sterilized":true}'

# Read (liste, puis détail)
curl http://localhost:8080/api/v1/dogs
curl http://localhost:8080/api/v1/dogs/1

# Update
curl -X PUT http://localhost:8080/api/v1/dogs/1 \
  -H "Content-Type: application/json" \
  -d '{"name":"Rex II","birthDate":"2019-06-15","breed":"Berger allemand","sterilized":false}'

# Delete
curl -X DELETE http://localhost:8080/api/v1/dogs/1

# Cas d'erreur : 404 attendu
curl -i http://localhost:8080/api/v1/dogs/999

# Cas d'erreur : 400 attendu (nom vide)
curl -i -X POST http://localhost:8080/api/v1/dogs \
  -H "Content-Type: application/json" \
  -d '{"name":"","breed":"Labrador"}'
```

```bash
docker exec -it kennel-mysql mysql -ukennel -pkennelpass kennel -e "SELECT * FROM dogs;"
```