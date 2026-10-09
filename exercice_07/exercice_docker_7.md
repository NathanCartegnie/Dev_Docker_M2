# Exercice 7

```bash
docker build -t kennel-mysql .

docker run -d --name kennel-db \
-e MYSQL_ROOT_PASSWORD=rootpass \
-p 3306:3306 \
kennel-mysql
```

```bash
docker exec -it kennel-db mysql -uroot -prootpass kennelDB -e "SHOW TABLES; SELECT * FROM chiens; SELECT * FROM chats;"

docker exec -it kennel-db mysql -uroot -prootpass kennelDB -e \
"SELECT c.pseudonyme, a.numero, a.rue, a.commune FROM clients c JOIN clients_adresses ca ON ca.client_id = c.id JOIN adresses a ON a.id = ca.adresse_id;"
```
