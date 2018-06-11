FROM node:10.4.0-alpine
MAINTAINER timo.tiuraniemi@iki.fi

# As root, install needed dedendencies and set environment variables for node
RUN apk add --no-cache gd-dev=2.2.5-r0
RUN apk add --no-cache make python g++ 
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV NODE_PATH /home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

# Switch to user "node"
ENV USER node
RUN mkdir /app && chown $USER:$USER /app
WORKDIR /app
USER $USER

# Install npm packages using node user
RUN npm install -g node-gd@1.5.4 pm2@2.10.4

# Remove build dependencies as root user
USER root
RUN apk del make python g++

# Back to node user
USER $USER
