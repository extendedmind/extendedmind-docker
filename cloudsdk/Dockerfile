FROM quay.io/extendedmind/openjdk:openjdk-8u151-4
MAINTAINER timo.tiuraniemi@iki.fi

# Install more packages with root
USER root

# Taken from https://hub.docker.com/r/salrashid123/cloud-sdk-docker/~/dockerfile/
RUN apk --no-cache add python rsync
ENV HOME /app

# Back to original user "java"
USER java

ARG CLOUD_SDK_VERSION=204.0.0
ARG SHA256SUM=276984a44a2a9dc1af5d3c859a1295897fd8cfc911738874daf007ab46143da5

RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz
RUN echo "${SHA256SUM}  google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz" > google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz.sha256
RUN sha256sum -c google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz.sha256
RUN tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz
RUN rm google-cloud-sdk-${CLOUD_SDK_VERSION}-*

ENV PATH /app/google-cloud-sdk/bin:$PATH
RUN gcloud config set core/disable_usage_reporting true
RUN gcloud config set component_manager/disable_update_check true
RUN gcloud --version

VOLUME ["/app/.config"]
