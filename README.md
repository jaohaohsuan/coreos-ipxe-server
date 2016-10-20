# CoreOS iPXE Server

The CoreOS iPXE Server attempts to automate as much of the [Booting CoreOS via iPXE](https://coreos.com/docs/running-coreos/bare-metal/booting-with-ipxe/) process as possible, mainly generating iPXE boot scripts and serving CoreOS PXE boot images.

## Table of Contents

- [Installation](#installation)
- [Getting Started](docs/getting_started.md)
- [API](docs/api.md)
- [Profiles](docs/profiles.md)
- [Docker setup example](docs/docker.md)

## Installation

### Binary Release

```
curl -L https://github.com/jaohaohsuan/coreos-ipxe-server/releases/download/v1.0/coreos-ipxe-server-darwin -o coreos-ipxe-server
chmod +x coreos-ipxe-server
```

#### Build Docker image

```
./build.sh
docker images | grep coreos-ipxe-server
```

#### Run

```
TAG=`git rev-parse --short HEAD`; docker run -d -p 4777:4777 coreos-ipxe-server:$TAG
```
