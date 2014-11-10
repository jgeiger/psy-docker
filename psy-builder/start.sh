#!/bin/sh

${TRANSPORT:−http}

if [ "$BUILD_IMAGE" = "" ]; then
  echo 'No build image specified.'
elif [ "$USERNAME" = "" ] || [ "$PASSWORD" = "" ]; then
  echo 'Incomplete login information for registry.'
else
  sudo wrapdocker &
  sleep 2
  docker ps
  docker login --username=$USERNAME --password=$PASSWORD --email=$EMAIL $TRANSPORT://$REGISTRY
  if [ $? -ne 0 ]; then
    echo 'Docker registry login error'
  else
    cd /home/psy
    git clone https://github.com/jgeiger/psy-docker.git
    cd psy-docker/$BUILD_IMAGE
    docker build -t $REGISTRY/$BUILD_IMAGE .
    docker push $REGISTRY/$BUILD_IMAGE
  fi
fi
