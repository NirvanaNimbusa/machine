FROM i386/ubuntu

RUN apt-get update && apt-get install -y wget make git gcc

#Install Golang for 32bit
RUN wget -q https://storage.googleapis.com/golang/go1.7.5.linux-386.tar.gz\
	&& tar -xf go1.7.5.linux-386.tar.gz\
	&& mv go /usr/local

ENV GOROOT=/usr/local/go GOPATH=/go PATH=/go/bin:/usr/local/go/bin:$PATH


RUN go get  github.com/golang/lint/golint \
            github.com/mattn/goveralls \
            golang.org/x/tools/cover

ENV USER root
WORKDIR /go/src/github.com/docker/machine

COPY . ./
RUN mkdir bin
