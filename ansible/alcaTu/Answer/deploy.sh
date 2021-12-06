#!/bin/bash

set -e

function check_env () {
    envname=$1
    if [[ -z ${!envname} ]]
    then
        echo "No '$1' environment variable were specified."
        exit 1
    fi
}

check_env ENVIRONMENT
check_env SERVICE
check_env PORT

mv microservices-demo/src/$SERVICE project/roles/deployment/files/
docker-compose run --rm ansible-runner
