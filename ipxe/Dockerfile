FROM debian:jessie

RUN apt-get update && \
 apt-get install -y gcc \
 binutils \
 make \
 perl \
 syslinux \
 liblzma-dev \
 genisoimage \
 git && \
 rm -rf /var/lib/apt/lists/*

RUN git clone git://git.ipxe.org/ipxe.git && \
  cd ipxe/src && \
  rm -rf .git && \
  make
COPY ./run.sh /
WORKDIR /ipxe/src
ENTRYPOINT ["/run.sh"]
