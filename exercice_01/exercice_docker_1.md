# Exercice 1

```bash
docker run -it --name mon-ubuntu ubuntu:latest

apt update && apt upgrade -y

apt install -y nginx

exit

docker commit mon-ubuntu ubuntu-nginx
```