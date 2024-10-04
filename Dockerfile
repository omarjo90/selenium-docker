FROM bellsoft/liberica-openjdk-alpine:latest

# install curl and jq
RUN apk add curl jq

WORKDIR /home/selenium-docker

# add require files to run tests
ADD target/docker-resources ./
ADD runner.sh runner.sh

# Fix for windows
RUN dos2unix runner.sh

# start runner.sh
ENTRYPOINT sh runner.sh

