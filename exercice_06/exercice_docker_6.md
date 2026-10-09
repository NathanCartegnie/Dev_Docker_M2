# Exercice 6

```bash
docker run -d --name dev-nginx -p 8080:80 \
  -v "$(pwd)":/usr/share/nginx/html:ro \
  nginx:alpine
  
http://localhost:8080
```