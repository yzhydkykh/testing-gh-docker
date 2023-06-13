# Stage 1: Build
FROM node:10-alpine

#WORKDIR /packages/app

# Install system dependencies
RUN apk update
# Install firebase-tools
RUN npm install -g firebase-tools

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
