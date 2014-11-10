#!/bin/sh

${TRANSPORT:−http}

if [ "$IMAGE" = "" ]; then
  echo 'No image specified.'
elif [ "$USERNAME" = "" ] || [ "$PASSWORD" = "" ]; then
  echo "Incomplete login information for registry."
else
  sudo wrapdocker &
  sleep 2
  docker ps
  docker login --username=$USERNAME --password=$PASSWORD --email=$EMAIL $TRANSPORT://$REGISTRY
  if [ $? -ne 0 ]; then
    echo 'Docker registry login error'
  else
    docker pull $REGISTRY/$IMAGE:latest
    docker run --rm $PARAMETERS $REGISTRY/$IMAGE
  fi
fi
