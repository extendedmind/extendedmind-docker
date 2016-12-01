FROM node:7.2.0-alpine
RUN apk add --no-cache gd-dev=2.2.3-r1
RUN apk add --no-cache make python g++ && \
    npm install -g node-gd@1.4.0 && \
    apk del make python g++ 
