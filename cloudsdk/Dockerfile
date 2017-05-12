# TODO: When Google official uses this, change the owner!
# https://hub.docker.com/r/google/cloud-sdk/
FROM salrashid123/cloud-sdk-docker:154.0.0
MAINTAINER timo.tiuraniemi@iki.fi
RUN apk --no-cache add tar rsync

# Also add kubectl to the mix
ADD https://storage.googleapis.com/kubernetes-release/release/v1.6.3/bin/linux/amd64/kubectl /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl
