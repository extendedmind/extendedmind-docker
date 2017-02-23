FROM alpine:3.5
MAINTAINER timo.tiuraniemi@iki.fi
ENV USER tcr

RUN apk add --no-cache curl tar rsync bash

RUN adduser -D -u 1000 $USER 
RUN mkdir /app && chown $USER:$USER /app
WORKDIR /app
USER $USER
