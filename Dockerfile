# dev environment
#

FROM ubuntu
MAINTAINER Pieter Linde

COPY apt/sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y curl \
	unzip \
	git \
	wget 

RUN mkdir ~/.nvm

RUN git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`

ENV NVM_DIR="/root/.nvm
RUN . ~/.nvm/nvm.sh && nvm install v4.2
RUN . ~/.nvm/nvm.sh && nvm use 4 && npm install tape && npm install -g mocha istanbul uglify-js jshint

# Download the golang binaries and extract to DIR go
COPY go /usr/local/go
COPY go_profile.sh /etc/profile.d/go_profile.sh
ENV PATH $PATH:/usr/local/go/bin
# start image with mapped GOPATH on host pointing to /go_path in container
ENV GOPATH /go_path

