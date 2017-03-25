#!/bin/bash

set -x

docker rm -fv `docker ps -a -q -f status=exited`
docker rmi -f `docker images -f 'dangling=true' -q`
wget -O /tmp/docker-cleanup-volumes.sh https://raw.githubusercontent.com/chadoe/docker-cleanup-volumes/master/docker-cleanup-volumes.sh
sudo -i /bin/bash /tmp/docker-cleanup-volumes.sh
sudo -i /bin/bash -c 'truncate --size=<512M /var/lib/docker/containers/**/*-json.log'
