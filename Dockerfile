# Development environment for Node and Go language

FROM ubuntu:14.04
MAINTAINER Pieter Linde

# don't do this any more
#COPY apt/sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y curl \
	unzip \
	git \
	wget

# Install nvm to control Node versions
RUN mkdir ~/.nvm
RUN git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`

ENV NVM_DIR="/root/.nvm
RUN . ~/.nvm/nvm.sh && nvm install v4.2 && nvm alias default 4
RUN . ~/.nvm/nvm.sh && nvm use default && npm install tape && npm install -g \
	mocha \
	istanbul \
	uglify-js \
	jshint \
	babel-cli

# Download the golang binaries and extract to DIR go/go
COPY go /usr/local/go/go
COPY go_profile.sh /etc/profile.d/go_profile.sh
ENV PATH $PATH:/usr/local/go/bin
# start image with mapped GOPATH on host pointing to /go_path in container
ENV GOPATH /go_path
