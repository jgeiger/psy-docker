start_jenkins_data(){
  JENKINS_DATA=$(docker run \
    --name=jenkins_data \
    --volume=/data/jenkins:/var/lib/jenkins \
    --volume=/var/log/jenkins \
    --interactive \
    --tty \
    --detach \
    busybox sh -l)
  echo "Started JENKINS_DATA in container $JENKINS_DATA"
}

start_jenkins(){
  JENKINS=$(docker run \
    --name=jenkins \
    --hostname=jenkins.local \
    --publish-all \
    --volumes-from=jenkins_data \
    --privileged=true \
    --volume=/var/lib/docker \
    --volume=/var/run/docker.sock:/var/run/docker.sock \
    --detach=true \
    jgeiger/psy-jenkins)
  echo "Started JENKINS in container $JENKINS"
}

start_registry_data(){
  REGISTRY_DATA=$(docker run \
    --name=registry_data \
    --volume=/data/registry:/registry \
    --interactive \
    --tty \
    --detach \
    busybox sh -l)
  echo "Started REGISTRY_DATA in container $REGISTRY_DATA"
}

start_registry(){
  REGISTRY=$(docker run \
    --name=registry \
    --hostname=registry \
    --publish-all \
    --volumes-from=registry_data \
    --env='SETTINGS_FLAVOR=local' \
    --env='STORAGE_PATH=/registry' \
    --env='DISABLE_TOKEN_AUTH=true' \
    --detach=true \
    registry)
  echo "Started REGISTRY in container $REGISTRY"
}

start_nginx(){
  NGINX=$(docker run \
    --name=nginx \
    --hostname=nginx.local \
    --publish=80:80 \
    --link=jenkins:jenkins \
    --link=registry:registry \
    --detach=true \
    jgeiger/psy-nginx)
  echo "Started NGINX in container $NGINX"
}

start_data(){
 start_jenkins_data
 start_registry_data
}

start_psy(){
  start_data
  start_jenkins
  start_registry
  start_nginx
}
