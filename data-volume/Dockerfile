FROM alpine:3.7
MAINTAINER timo.tiuraniemi@iki.fi
ENV USER dv

RUN adduser -D -u 1000 $USER 
RUN mkdir /app && chown $USER:$USER /app
WORKDIR /app
USER $USER

ENTRYPOINT /bin/true
