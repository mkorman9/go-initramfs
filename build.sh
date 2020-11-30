#!/bin/bash

mkdir -p out

cd shell/ &&
    CGO_ENABLED=0 go build -o ../out/shell && \
    cd ..

cd img/ && \
    cp ../out/shell bin/ && \
    cp ../init . && \
    find . -print0 | cpio --null --create --verbose --format=newc | gzip --best > ../out/go-initramfs.cpio.gz && \
    cd ..
