# Nginx, PHP FPM, MariaDB and Memcache with Docker Compose based on [Baseimage Flatten](https://registry.hub.docker.com/u/etrere/baseimage-flatten/)

## Requirements

Install [Docker](https://www.docker.io/) and [Compose](http://docs.docker.com/compose/install/)

## Start
```
docker-compose up -d
```

Builds, (re)creates, starts, and attaches to containers based on docker-compose.yml.

**To see it work**:
 * [http://localhost/](http://localhost/) for the phpinfo served by PHP FPM
 * [http://localhost/nginx-logo.png](http://localhost/nginx-logo.png) for the static served directly by Nginx

PHP files are in /data/php

Static files are in /data/nginx

## Logs
```
docker-compose logs
```

Displays log output from containers

You can find extra log in /log

## Stop
```
docker-compose stop
```

Stops running containers without removing them.

They can be started again with ```docker-compose start```.

## Delete
```
docker-compose rm
```

Removes stopped service containers

-----------------------------------------

**Inspired by**:
 * [docker-lemp](https://github.com/stucki/docker-lemp)
 * [phusion/baseimage-docker](https://github.com/phusion/baseimage-docker)
 * [dokku-alt-mariadb](https://github.com/yabawock/dokku-alt-mariadb)