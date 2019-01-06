#!/bin/bash
#         
# Build the easy-php dev environment so easy by Docker
#
# Author TIGERB <tigerb.cn>

easy_path=$1
intranet_ip=$2
os=$3
osx=$4
domain=$5
port=$6

# ------------------ hosts & nginx conf ---------------------

# add host
# echo "$intranet_ip $domain" >> /etc/hosts

# use docker network
# exchange ip for  nginx/conf/conf.d
# sed "s/{{intranet}}/$intranet_ip/g" $easy_path/nginx/conf/conf.d/easy.conf.tpl > $easy_path/nginx/conf/conf.d/easy.conf
# sed "s/{{intranet}}/$intranet_ip/g" $easy_path/nginx/conf/conf.d/xhgui.conf.tpl > $easy_path/nginx/conf/conf.d/xhgui.conf

# ------------------ php ---------------------
echo -e "\033[36m[STEP]\033[0m -> Clone & Init the project..."

# create project & init the project
cd $easy_path/www && composer create-project tigerb/easy-php easy --prefer-dist && cd easy

cp .env.example .env
chmod -R 777 runtime
composer dump-autoload --optimize
git init && git add -A && git commit -m 'feat(all): project init commit'
cp -r ./.git-hooks/* ./.git/hooks && chmod +x ./.git/hooks/pre-commit && chmod +x ./.git/hooks/commit-msg

# get xghui
cd $easy_path/www
git clone https://github.com/laynefyc/xhgui-branch.git
sed "s/{{intranet}}/$intranet_ip/g" $easy_path/configs/xhgui/config.default.php > $easy_path/www/xhgui-branch/config/config.default.php

echo -e "\033[36mdone.\033[0m"

# ------------------ docker ---------------------

echo -e "\033[36m[STEP]\033[0m -> Init & Start the docker container..."

# create network
docker network create easy

# init docker env
docker-compose up -d

# composer install xghui
docker exec easy-env_php727_1 sh -c "cd /mnt/www/xhgui-branch && php install.php"

echo -e "\033[36mdone.\033[0m"
# ------------------ fe ---------------------
echo -e "\033[36m[STEP]\033[0m -> Build frontent..."

# step 1
cd $easy_path/www/easy/frontend && yarn install

# step 2
DOMAIN=http://$domain:$port npm run demo

# step 3
if [[ "$os" == "$osx" ]] 
then
  # mac os
  open "http://$domain:$port/index.html"
else
  if [[ ! -f "/usr/bin/xdg-open" ]]
  then
    echo "Install xdg-open, input your password:"
    sudo apt-get install snapd-xdg-open
  fi
  # debian os
  xdg-open "http://$domain:$port/index.html"
fi

echo -e "\033[36m ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \033[0m"
echo -e "\033[36mNow Bind your host in /etc/hosts: \033[0m"
echo -e "$intranet_ip xhgui.demo.io"
echo -e "$intranet_ip easy-php.demo.io"