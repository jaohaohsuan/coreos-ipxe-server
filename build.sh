#/bin/bash
set -x
TAG=`git rev-parse --short HEAD`
docker run --rm -v `pwd`:/go/src/github/jaohaohsuan/coreos-ipxe-server golang sh -c "go get github.com/kelseyhightower/coreos-ipxe-server; cd /go/src/github/jaohaohsuan/coreos-ipxe-server; export GOOS=linux; go build -o coreos-ipxe-server-linux ."

docker build -t coreos-ipxe-server:$TAG .
