# Dockerfile for Node-RED - pulls latest master code from git
# Use the node.js v0.10.36 engine
FROM node:0.10-slim
MAINTAINER ceejay
 
# download latest stable node-red
RUN npm install -g node-red
 
# expose port
EXPOSE 1880
 
# Set the default command to execute
# when creating a new container
CMD /usr/local/bin/node-red