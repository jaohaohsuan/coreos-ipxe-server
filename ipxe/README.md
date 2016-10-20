# how to make ipxe.iso

## write scripts

[Here](http://ipxe.org/scripting) is the documents.
Change the [coreos-ipxe-server](scripts/coreos-macd.ipex) address.

```
#!ipxe

dhcp
prompt --key 0x02 --timeout 2000 Press Ctrl-B for the iPXE command line... && shell ||
echo mac ${net0/mac:hexhyp}
chain http://192.168.60.100:4777/?profile=${net0/mac:hexhyp}
```

## build & run

```
docker build -t ipxe:debian .
docker run -it --rm -v `pwd`/scripts:/scripts ipxe:debian myscript.ipxe
ls -l scripts/*.iso
```

You should see the `ipxe.iso`

[ref](http://ipxe.org/download)
