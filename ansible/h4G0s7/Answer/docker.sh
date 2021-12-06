#!/bin/bash

set -e

if [[ "$1" == "--connect" ]]
then
	dpkg -s docker-ce-cli
	mkdir -p ~/.docker/
	ssh -nNT -L ~/.docker/docker.sock:/home/$1/.docker/run/docker.sock $2@$3
	export DOCKER_HOST=~/.docker/docker.sock
elif [[ "$1" == "--disconnect" ]]
then
	rm -f ~/.docker/docker.sock
fi
