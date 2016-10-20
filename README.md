# CoreOS iPXE Server

The CoreOS iPXE Server attempts to automate as much of the [Booting CoreOS via iPXE](https://coreos.com/docs/running-coreos/bare-metal/booting-with-ipxe/) process as possible, mainly generating iPXE boot scripts and serving CoreOS PXE boot images.

## Table of Contents

- [Make ipxe.iso](ipxe/README.md)
- [Installation](#installation)
- [Getting Started](docs/getting_started.md)
- [API](docs/api.md)
- [Profiles](docs/profiles.md)
- [Docker setup example](docs/docker.md)

## Installation

#### Binary Release

```
curl -L https://github.com/jaohaohsuan/coreos-ipxe-server/releases/download/v1.0/coreos-ipxe-server-darwin -o coreos-ipxe-server
chmod +x coreos-ipxe-server
```

#### Build Docker image

```
./build.sh
docker images | grep coreos-ipxe-server
```
#### setup DATA_DIR
You should check your VM `eth card mac` address before running setup.

I use the [mac address](ipxe/scripts/coreos-macd.ipxe#L5) as the profile name.
```
./setup.sh
tree opt
```
You should see like this
```
opt
├── configs
│   └── plain.yml
├── images
│   └── amd64-usr
│       ├── 1122.0.0
│       │   ├── coreos_production_pxe_image.cpio.gz
│       │   └── coreos_production_pxe.vmlinuz
│       └── 1192.1.0
│           ├── coreos_production_pxe_image.cpio.gz
│           └── coreos_production_pxe.vmlinuz
├── profiles
│   └── 08-00-27-95-1d-f8.json
└── sshkeys
    └── coreos.pub
```

#### Run

```
TAG=`git rev-parse --short HEAD`; docker run -v `pwd`/opt:/opt/coreos-ipxe-server -d -p 4777:4777 coreos-ipxe-server:$TAG
curl http://127.0.0.1:4777?profile=08-00-27-95-1d-f8
```
