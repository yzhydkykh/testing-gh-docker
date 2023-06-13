# Stage 1: Build
FROM FROM node:10-alpine

#WORKDIR /packages/app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends build-essential gcc


# Stage 2: Runtime
FROM node:10-alpine as runtime

#WORKDIR /packages/app

# Install firebase-tools
RUN npm install -g firebase-tools

# create root application folder
WORKDIR /app

# copy configs to /app folder
COPY package*.json ./
COPY tsconfig.json ./
# copy source code to /app/src folder
COPY src /app/src

# Make sure scripts in .local are usable:
ENV PATH=/root/.local:$PATH

# Copy your application code to the container (make sure you create a .dockerignore)
COPY . .

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
