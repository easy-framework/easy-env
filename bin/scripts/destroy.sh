#!/bin/bash
#         
# Build the easy-php dev environment so easy by Docker
#
# Author TIGERB <tigerb.cn>

easy_path=$1

rm -rf $easy_path/www/easy
rm -rf $easy_path/www/xhgui-branch

docker-compose -f $EASY_PATH/docker-compose.yaml stop

docker-compose -f $EASY_PATH/docker-compose.yaml rm