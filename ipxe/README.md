# How to make ipxe.iso

## write scripts

Change the [coreos-ipxe-server](scripts/coreos-macd.ipxe) address.

```
#!ipxe

dhcp
prompt --key 0x02 --timeout 2000 Press Ctrl-B for the iPXE command line... && shell ||
echo mac ${net0/mac:hexhyp}
chain http://192.168.60.100:4777/?profile=${net0/mac:hexhyp}
```
[Here](http://ipxe.org/scripting) is the documents.

## build & run

```
docker build -t ipxe:debian .
docker run -it --rm -v `pwd`/scripts:/scripts ipxe:debian coreos-macd.ipxe
ls -l scripts/iso/*.iso
```

You should see the `ipxe.iso` that can be mount on your vm.

[More](http://ipxe.org/download)
