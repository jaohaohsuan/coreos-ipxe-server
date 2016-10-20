FROM golang
COPY coreos-ipxe-server-linux /usr/local/bin/coreos-ipxe-server
EXPOSE 4777
ENTRYPOINT ["coreos-ipxe-server"]
