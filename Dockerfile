# Dockerfile for Node-RED - pulls latest master code from git
FROM node:0.10.36

MAINTAINER ceejay
 
# add universe repository to /etc/apt/sources.list
# we need it later as rlwrap is required by node.js
#RUN sed -i s/main/'main universe'/ /etc/apt/sources.list
 
# make sure everything is up to date - update and upgrade
# RUN apt-get update -y
# RUN apt-get upgrade -y
 
# install dependencies
#RUN apt-get install python-software-properties python g++ make software-properties-common wget curl unzip git -y
#RUN apt-get install build-essential python-dev wget curl unzip git -y 
#RUN apt-get install wget curl unzip git -y 
 
# add node.js repo
#RUN curl -sL https://deb.nodesource.com/setup | sudo bash -
 
# download latest stable node-red
RUN npm install -g node-red
 
# remove some nodes

 
# install node-red node_modules
#RUN cd /opt/node-red && npm install --production && npm install eyes js2xmlparser fs.notify
 
# add extra nodes project so we have the lot just in case.
#RUN cd /opt/node-red/nodes && git clone https://github.com/node-red/node-red-nodes.git
 
# expose port
EXPOSE 1880
 
# Set the default command to execute
# when creating a new container
CMD /usr/bin/node-red