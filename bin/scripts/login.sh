#!/bin/bash
#         
# Build the easy-php dev environment so easy by Docker
#
# Author TIGERB <tigerb.cn>

service=$1

if [[ "$service" == "php" ]]
then
    service="php727"
fi

docker exec -it easy-env_"$service"_1 sh