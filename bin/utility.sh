DIR="$( cd "$( dirname "$0" )" && pwd )"

#-------------------------------------------------------------------------------
killz(){
  echo "Killing all docker containers:"
  docker kill $(docker ps --quiet)
}

#-------------------------------------------------------------------------------
stop(){
  echo "Stopping all docker containers:"
  docker stop $(docker ps --all --quiet)
}

#-------------------------------------------------------------------------------
delete(){
  echo "Deleting stopped docker containers:"
  docker rm $(docker ps --all --quiet --filter status=exited)
}

#-------------------------------------------------------------------------------
rmi(){
  echo "Removing all untagged images:"
  docker rmi $(docker images --quiet --filter dangling=true)
}

#-------------------------------------------------------------------------------
delete_all(){
  echo "Deleting ALL containers!"
  docker rmi $(docker images --quiet)
}
