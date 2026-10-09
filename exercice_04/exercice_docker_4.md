# Exercice 4

```bash
docker network create mon-reseau

docker run -it --name ping1 --network mon-reseau ubuntu

apt update && apt install -y iputils-ping
exit

docker commit ping1 ubuntu-ping

docker run -dit --name ping2 --network mon-reseau ubuntu-ping

docker start ping1
```