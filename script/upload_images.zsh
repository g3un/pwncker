#!/bin/zsh

USER="g3un"
IMAGES=(
    "pwn16"
    "pwn17"
    "pwn18"
    "pwn19"
    "pwn20"
    "pwn21"
    "pwn22"
)
TAG="v1.2.4"

for IMAGE in "${IMAGES[@]}"; do
    sudo docker build -t $USER/$IMAGE:$TAG $IMAGE &&\
    sudo docker push $USER/$IMAGE:$TAG &&\
    sudo docker image rm $USER/$IMAGE:$TAG
done
