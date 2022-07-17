# docker4php

**`Docker 4 PHP`** is a set of docker compose files, which can be used to setup the development environment.

You can use the provided YML files with docker-compose and prepare your development environment.

## Docker installation
**`A docker installation is strongly required before you start.`**

Windows user

* Docker should be already installed in your machine. If not, open a ticket to IT Support to help you install it.
* Under root folder of this repo there is a file named `.env.windows`. Rename it to `.env`
* If you have issues using docker-compose, try to add `winpty` as a prefix, i.e. `winpty docker-compose up -d`

MacOS user

* Docker should be already installed in your machine. If not, open the Managed Software Center app to install it.
* When it is installed, you have to open the Docker Preferences (from the icon at the top bar) and add a file sharing directory at the list, which will be the path where you stored `docker4php` folder.

## GIT Stash Configuration
All containers mount the `.ssh` folder from your user home, so your SSH key you use with the stash is shared with each container. That gives you the ability to use git inside the container as well.

**Copy `.global.env.example` and create a new file named `.global.env`**

But your git global config is not shared. That's why you need to edit the file `.global.env` and set your personal info at it.
```
GIT_USER_NAME=Your Full Name
GIT_USER_EMAIL=your.email@hostelworld.com
```
The above info is going to be used with all the containers automatically, without you need to do anything else.

## Configure LeaseWeb challenge project

To configure leaseWeb challenge, you need to first configure traefik.

```
cd <path to folder>/docker4php
make up
```

After it downloads all containers, make sure all of them are up and running.

```
docker ps -a

CONTAINER ID   IMAGE                            COMMAND                  CREATED          STATUS          PORTS                    NAMES
d756f7cf6944   wodby/nginx:1.21-5.24.1          "/docker-entrypoint.…"   21 minutes ago   Up 21 minutes   80/tcp                   leaseWeb_nginx
a343cde69125   wodby/php:7.4-dev-macos-4.32.3   "/docker-entrypoint.…"   21 minutes ago   Up 21 minutes   9000/tcp                 leaseWeb_php
4d12a19d7b71   wodby/mariadb:10.8-3.21.0        "/docker-entrypoint.…"   21 minutes ago   Up 21 minutes   0.0.0.0:3306->3306/tcp   leaseWeb_mariadb
e891cd20bc70   traefik:v2.0                     "/entrypoint.sh --ap…"   21 minutes ago   Up 21 minutes   0.0.0.0:8000->80/tcp     leaseWeb_traefik
767c15bd2f27   mailhog/mailhog                  "MailHog"                21 minutes ago   Up 21 minutes   1025/tcp, 8025/tcp       leaseWeb_mailhog
```

### configure the symfony project

After these steps, follow the next steps on the project readme file [leaseWeb configs](https://github.com/heldernunes/leaseWebChallenge#readme)
