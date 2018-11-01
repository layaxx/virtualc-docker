#!/bin/bash

if [ -z $(docker images -q virtualc:1.8.0) ]; then 
	docker build . \
		-t virtualc:1.8.0 \
		--build-arg userID=$(id -u) \
		--build-arg userName=$USER
fi

WAYLAND_OPTION=''
if [ $XDG_SESSION_TYPE=="wayland" ]; then
	WAYLAND_OPTION='--ipc=host'
fi

xhost +SI:localuser:$USER

docker run \
	--rm \
    	-d \
	$WAYLAND_OPTION \
	-e DISPLAY=unix$DISPLAY \
	-e VIRTUAL_C_RESOURCE_PATH=/usr/share/doc/virtualc \
	-e VIRTUAL_C_INCLUDE_PATH=/usr/lib/virtualc \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v $HOME:$HOME \
	--name virtualc \
	virtualc:1.8.0
