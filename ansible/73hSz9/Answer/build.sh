#!/bin/bash

set -e 

if [[ -z $1 ]]
then
	echo "No 'service' argument were specified"
	exit 1
fi

ansible-bender build -p playbook-$1.yml --python-interpreter /usr/bin/python3
buildah images | grep -vE "none|failed"
