# Stage 1: Build
FROM node:10-alpine

#WORKDIR /packages/app

# Install system dependencies
RUN apk update
# Install firebase-tools
RUN npm install -g firebase-tools
# Copies your code file from your action repository to the filesystem path `/` of the container
COPY install-functions.sh /install-functions.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
CMD ["/install-functions.sh"]
