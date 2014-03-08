# Dockerfile for Node-RED - pulls latest master code from git
FROM ubuntu:12.04
 
# based on the original by @cpswan
MAINTAINER ceejay
 
# add universe repository to /etc/apt/sources.list
# we need it later as rlwrap is required by node.js
#RUN sed -i s/main/'main universe'/ /etc/apt/sources.list
 
# make sure everything is up to date - update and upgrade
RUN apt-get update -y
# RUN apt-get upgrade -y
 
# install dependencies
#RUN apt-get install python-software-properties python g++ make software-properties-common wget curl unzip git -y
RUN apt-get install python-software-properties wget curl unzip git -y
 
# add node.js repo
RUN add-apt-repository ppa:chris-lea/node.js -y
 
# another update so added repo can be used
RUN apt-get update
 
# install node.js
RUN apt-get install nodejs -y
 
# download latest node-red
RUN cd /opt && git clone https://github.com/node-red/node-red.git
 
# remove some nodes
RUN cd /opt/node-red/nodes/core && rm -rf hardware deprecated
RUN cd /opt/node-red/nodes/core/io && rm -f 25-serial*
 
# install node-red node_modules
RUN cd /opt/node-red && npm install --production && npm install eyes js2xmlparser fs.notify
 
# add extra nodes project so we have the lot just in case.
#RUN cd /opt/node-red/nodes && git clone https://github.com/node-red/node-red-nodes.git
 
# expose port
EXPOSE 1880
 
# Set the default command to execute
# when creating a new container
CMD /usr/bin/node /opt/node-red/red.js -v flow.json