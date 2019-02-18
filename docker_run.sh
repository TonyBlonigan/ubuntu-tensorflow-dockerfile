CONTAINER_NAME=keras1
LOCAL_MOUNT_DIR=docker_mount
CWD=$(pwd)

echo stopping $CONTAINER_NAME container
if docker ps | grep $CONTAINER_NAME
  then docker stop $CONTAINER_NAME && echo stopped
  else echo no running $CONTAINER_NAME container to stop
fi

echo removing $CONTAINER_NAME container
if docker ps -a | grep $CONTAINER_NAME
  then docker rm $CONTAINER_NAME && echo removed
  else echo no previous $CONTAINER_NAME container to remove
fi

echo making sure host has mount dir
if [ ! -d "$LOCAL_MOUNT_DIR" ]; 
  then mkdir $LOCAL_MOUNT_DIR && chmod a+w $LOCAL_MOUNT_DIR && echo created $LOCAL_MOUNT_DIR on host
fi

echo starting $CONTAINER_NAME container
docker run -d -p 80:8888 -v $CWD/$LOCAL_MOUNT_DIR:/src/$LOCAL_MOUNT_DIR --name $CONTAINER_NAME keras:1

echo adding final packages in hacky way
docker exec $CONTAINER_NAME pip install --upgrade pip

docker exec $CONTAINER_NAME pip install sqlitedict currencyconverter

docker exec $CONTAINER_NAME conda install pyodbc -y

docker logs $CONTAINER_NAME | sed 's/.*:8888/http:\/\/mn4dapptstl008.ideasdev.int:80/'

