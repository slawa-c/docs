docker version

docker info

Registry
```
docker run - -rm hello-world
docker container run - -rm hello-world
```


Create
```
docker create <options> <image name:tag>
docker container create <options> <image name:tag>
```

- CONTAINER INFO
```
docker ps <options>
docker container ls <options>
--->>>
CONTAINER ID — идентификатор контейнера
IMAGE — образ на основании которого был создан контейнер
COMMAND — команда которая используется как основной процесс
CREATED — время когда был создан контейнер
STATUS — статус контейнера (запащен, на пазуе, остановлен с ошибкой и т.д.)
PORTS — внутренние порты и мапинг портов
NAMES — имя контейнера
```   

- RUN NGINX
```
docker run - -publish 80:80 nginx
docker run -p 80:80 nginx
docker container run - -publish 80:80 nginx
docker container run -p 80:80 nginx
-->>
1. Загружается образ из Docker Hub
2. Запускает контейнер для этого образа
3. Открывает 80 порт для host IP
4. Перенаправляет трафик на 80−й порт контейнера
```

- RUN NGINX: DETACHED
```
docker run - -publish 80:80 - -detach nginx
docker run -p 80:80 -d nginx
docker container run - -publish 80:80 - -detach nginx
docker container run -p 80:80 -d nginx
```

- RUN NGINX: NAME
```
docker run --name webhost nginx
docker container run --name webhost nginx
```


- REMOVE CONTAINER
```
docker rm <options> <container name> or <hash>
docker container rm <options> <container name> or <hash>
```

STOP CONTAINER 
```
docker stop <container name> or <hash>
docker container stop <container name> or <hash>
```

- PAUSE CONTAINER
```
docker pause <container name> or <hash>
docker container pause <container name> or <hash>
```

- START CONTAINER
```
docker start <container name> or <hash>
docker container start <container name> or <hash>
```

- UNPAUSE CONTAINER 
```
docker unpause <container name> or <hash>
docker container unpause <container name> or <hash>
```

- INSPECT CONTAINER 
```
docker inspect <container name> or <hash>
docker container inspect <container name> or <hash>
```

- CONTAINER PROCESSES
```
docker top <container name> or <hash>
docker container top <container name> or <hash>
```

- CONTAINERS STATS
```
docker stats
docker container stats
```






   
   
