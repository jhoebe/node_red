install docker
	sudo apt-get install linux-image-generic-lts-raring linux-headers-generic-lts-raring
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
	sudo reboot

then
	sudo apt-get install lxc-docker

add yourself to docker group  for when you get fed up with all the sudo below...
	sudo groupadd docker
	sudo gpasswd -a ${USER} docker
	sudo service docker restart

install Node-RED from gist
	sudo docker build -rm -t dcj/node-red http://gist.github.com/raw/9435867/Dockerfile
or	sudo docker build -rm -t dcj/node-red git://gist.github.com/9435867.git

(or scp Dockerfile and build)
	sudo docker build -rm -t dcj/node-red - < Dockerfile

run (as daemon)
	sudo docker run -d -p 1880:1880 dcj/node-red

command line
	sudo docker run -i -t dcj/node-red /bin/bash

show running containers
	sudo docker ps -a

show all images (so you can tidy up)
	sudo docker images
