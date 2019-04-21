
<p align="center">
<a href="http://naruto.tigerb.cn/"><img src="https://img.shields.io/badge/os-Linux%26Darwin-blue.svg" alt="OS"></a>
</p>

> Just one command to build all env for the easy-php

[![easy-env](https://asciinema.org/a/219911.svg)](https://asciinema.org/a/219911?autoplay=1)

# How to use?

Please install the docker & npm & yarn first!


> curl -sL https://raw.githubusercontent.com/easy-framework/easy-env/master/bin/init.sh | bash && source ~/.profile


### Commands:

```shell
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

# file structure

```
├── README.md
├── _config.yml
├── bin
│   ├── easy
│   └── scripts
│       ├── destroy.sh
│       ├── init.sh
│       ├── login.sh
│       ├── restart.sh
│       ├── start.sh
│       └── stop.sh
├── composer.json
├── configs
│   └── xhgui
│       └── config.default.php
├── docker-compose.yaml
├── mongo
│   └── Dockerfile
├── mysql
│   └── Dockerfile
├── nginx
│   ├── Dockerfile
│   └── conf
│       ├── conf.d
│       └── nginx.conf
├── php
│   ├── Dockerfile
│   ├── conf
│   │   ├── conf.d
│   │   ├── php-fpm.conf
│   │   ├── php-fpm.d
│   │   └── php.ini
│   └── extensions
│       └── no-debug-non-zts-20170718
├── redis
│   └── Dockerfile
├── runtime
│   └── logs
│       ├── mongo
│       ├── nginx
│       ├── php
│       └── redis
└── www
```


# Initialization process

Yeah, That's so cool. I enjoy the feeling when I only need to execute one command, As the same time, my project and development enviorment, etc. all is ready. What's more, the project is opened in the windows by the command.
Meanwhile, **xhgui is support**.

<p align="center"><img width="30%" src="http://cdn.tigerb.cn/easy-env.png"></p>

# docker images:

```
REPOSITORY         TAG                   IMAGE ID            CREATED             SIZE
mongo              3.6-jessie            ceee4d1620d4        4 days ago          368MB
php                7.2.7-fpm-alpine3.6   39b42adef50e        3 weeks ago         79.9MB
mysql              5.7                   66bc0f66b7af        3 weeks ago         372MB
redis              4-alpine              caaeda72bf8f        5 weeks ago         27.8MB
nginx              1.15-alpine           bc7fdec94612        6 weeks ago         18MB
```
