# how to make ipxe.iso

## write scripts

[Here](http://ipxe.org/scripting) is the documents.
```
vim scripts/myscript.ipxe
```

## build & run

```
docker build -t ipxe:debian .
docker run -it --rm -v `pwd`/scripts:/scripts ipxe:debian myscript.ipxe
ls -l scripts/*.iso
```

You should see the `ipxe.iso`

[ref](http://ipxe.org/download)
