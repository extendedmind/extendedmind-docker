FROM node:7.4.0-alpine
RUN apk add --no-cache gd-dev=2.2.3-r1
RUN apk add --no-cache make python g++ && \
    npm install -g node-gd@1.4.0 && \
    apk del make python g++ 
ENV NODE_PATH /usr/local/lib/node_modules
