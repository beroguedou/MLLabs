#!/bin/bash

NAME="notebook"
use_gpu=""
op=""

# check for the operation start | stop
for arg in "$@"; do
    if [ "$arg" = "start" ]; then 
        op="start"
        break
    elif [ "$arg" = "stop" ]; then 
        op="stop"
        break
    fi
done

# check if gpu flag is provided
for arg in "$@"; do
    if [ "$arg" = "-g" ]; then
        use_gpu="true"
        break
    fi
done



if [ "$op" = "start" ]; then 
    if [ "$use_gpu" = "true" ]; then
        echo "***********Starting container using GPU***********"
        docker run -d --gpus all -it -p 8888:8888 -p 6006:6006 \
            --name=$NAME \
            --hostname="root" \
            -v /home/data:/root/\
            --ipc=host mllabs:1.0 jupyter notebook \
            --no-browser --ip=0.0.0.0 --allow-root \
            --NotebookApp.token= --notebook-dir='/root'

    else
        echo "***********Starting container using CPU-Only***********"
        docker run -d -it -p 8888:8888 -p 6006:6006 \
            --name=$NAME \
            --hostname="root" \
            -v /home/data:/root/stockage\
            --ipc=host mllabs:1.0 jupyter notebook \
            --no-browser --ip=0.0.0.0 --allow-root \
            --NotebookApp.token= --notebook-dir='/root'
    fi
elif [ "$op" = "stop" ]; then 
    echo "***********Stopping container***********"
    docker stop $NAME
    docker rm $NAME
else
    echo "***********Please insert 'start' or 'stop'***********"
    exit
fi
