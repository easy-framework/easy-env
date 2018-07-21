
<p align="center">
<a href="http://naruto.tigerb.cn/"><img src="https://img.shields.io/badge/os-Linux%26Darwin-blue.svg" alt="OS"></a>
</p>

> Just one command to build all env for the easy-php

<p align="center"><img  width="100%" src="http://cdn.tigerb.cn/easy-env-gif.gif"></p>


# Initialization process

Yeah, That's so cool. I enjoy the feeling when I only need to execute one command, As the same time, my project and development enviorment, etc. all is ready. What's more, the project is opened in the windows by the command.
Meanwhile, **xhgui is support**.

<p align="center"><img width="18%" src="http://cdn.tigerb.cn/easy-env.png"></p>

# How to use?

Please install the docker & npm & yarn first!


> echo export EASY_PATH=$(pwd) >> ~/.profile && echo 'export PATH="$PATH:$EASY_PATH/bin"' >> ~/.profile && source ~/.profile


### Commands:

```
Usage:
    easy init/start/restart/stop/destroy/login

Example:
    easy init
    easy start
    easy restart
    easy stop
    easy destroy
    easy login <php/redis/nginx/mysql/mongo>
```

# directory

```
|-- README.md
|-- _config.yml
|-- bin
|   |-- easy
|   `-- scripts
|-- composer.json
|-- configs
|   `-- xhgui
|-- docker-compose.yaml
|-- mongo
|   `-- Dockerfile
|-- mysql
|   `-- Dockerfile
|-- nginx
|   |-- Dockerfile
|   `-- conf
|-- php
|   |-- Dockerfile
|   |-- conf
|   `-- extensions
|-- redis
|   `-- Dockerfile
|-- runtime
|   `-- logs
`-- www
    |-- easy
    `-- xhgui-branch
```

# docker images:

```
REPOSITORY                               TAG                   IMAGE ID            CREATED             SIZE
mongo              3.6-jessie            ceee4d1620d4        4 days ago          368MB
php                7.2.7-fpm-alpine3.6   39b42adef50e        3 weeks ago         79.9MB
mysql              5.7                   66bc0f66b7af        3 weeks ago         372MB
redis              4-alpine              caaeda72bf8f        5 weeks ago         27.8MB
nginx              1.15-alpine           bc7fdec94612        6 weeks ago         18MB
```