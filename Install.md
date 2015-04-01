Install docker as per latest instructions at

	 https://docs.docker.com/installation/

e.g. for Ubuntu 14.04

        sudo apt-get update
        sudo apt-get install linux-image-generic-lts-trusty wget
	wget -qO- https://get.docker.com/ | sh

add yourself to docker group  for when you get fed up with all the sudo below...

	sudo usermod -aG docker $USER
	sudo service docker restart

install Node-RED from the gist above

    sudo docker build -rm -t davecj/node-red http://gist.github.com/raw/9435867/Dockerfile
    or
    sudo docker build -rm -t davecj/node-red git://gist.github.com/9435867.git

(or copy / paste the Dockerfile and build)

    sudo docker build -rm -t davecj/node-red - < Dockerfile

run (as daemon)

    sudo docker run -d -p 1880:1880 --name mynodered davecj/node-red

start a command line inside the container

    sudo docker run -it --rm -p 1880:1880 --name mynodered davecj/node-red /bin/bash

show running containers

    sudo docker ps -a

show all images (so you can tidy up)

    sudo docker images
