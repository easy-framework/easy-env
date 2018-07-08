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

# exchange ip for  nginx/conf/conf.d/easy.conf
sed "s/{{intranet}}/$intranet_ip/g" $easy_path/nginx/conf/conf.d/easy.conf.tpl > $easy_path/nginx/conf/conf.d/easy.conf

# ------------------ php ---------------------
echo -e "\033[36m[STEP]\033[0m -> clone & init the project..."

# create project & init the project
cd $easy_path/www && composer create-project tigerb/easy-php easy --prefer-dist && cd easy

cp .env.example .env
chmod -R 777 runtime
composer dump-autoload --optimize
git init && git add -A && git commit -m 'feat(all): project init commit'
cp -r ./.git-hooks/* ./.git/hooks && chmod +x ./.git/hooks/pre-commit && chmod +x ./.git/hooks/commit-msg

echo -e "done."

# ------------------ docker ---------------------

echo -e "\033[36m[STEP]\033[0m -> init & start docker container..."

# init docker env
docker-compose up -d

echo -e "done."
# ------------------ fe ---------------------
echo -e "\033[36m[STEP]\033[0m -> build frontent..."

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