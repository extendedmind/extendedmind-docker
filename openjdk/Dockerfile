FROM openjdk:8u111-jdk-alpine
RUN addgroup -S app && adduser -S -g app app 
RUN mkdir /app && chown app:app /app
WORKDIR /app
USER app

