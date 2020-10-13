#!/bin/bash

cd `dirname $0`

TAG=$1

if [ -z $TAG ]; then
	echo "Version to build is not specified" > /dev/stderr
	exit 1
fi

set -e 
git checkout $TAG

IMAGE=docker.antban.ru/facemetric/prom_telegram:$TAG

make clean all
docker build -t $IMAGE .

docker login docker.antban.ru
docker push $IMAGE
