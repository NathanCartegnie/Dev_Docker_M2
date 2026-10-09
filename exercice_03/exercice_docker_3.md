# Exercice 3

```bash
docker build -t site-exercice03 .

docker run -d --name site03 -p 8080:80 site-exercice03

http://localhost:8080
```