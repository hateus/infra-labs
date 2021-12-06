#!/bin/bash

set -e

service=$1
platform=$2

cd $service
for filename in .env.$platform.*; do
  cp $filename $(echo $filename | sed s/".$platform"//)
done

docker-compose --file=docker-compose.$platform.yml up -d
