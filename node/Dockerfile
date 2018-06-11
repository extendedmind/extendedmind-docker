FROM node:10.4.0-alpine
MAINTAINER timo.tiuraniemi@iki.fi
ENV USER node

RUN apk add --no-cache gd-dev=2.2.5-r0
RUN apk add --no-cache make python g++ && \
    npm install -g node-gd@1.5.4 pm2@2.10.4 && \
    apk del make python g++ 
ENV NODE_PATH /usr/local/lib/node_modules

RUN mkdir /app && chown $USER:$USER /app
WORKDIR /app
USER $USER
