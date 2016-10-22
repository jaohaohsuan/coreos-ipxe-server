#!/bin/bash
set -e
mkdir -p /scripts/iso
cp /scripts/*.ipxe /ipxe/src/
cd /ipxe/src
make bin/ipxe.iso
make bin/ipxe.iso EMBED="$1" 
exec cp -v bin/ipxe.iso /scripts/iso/$(basename -s .ipxe $1).iso
