#!/bin/bash

mkdir -p out

cd terminal/ &&
    CGO_ENABLED=0 go build -o ../out/terminal && \
    cd ..

cd img/ && \
    cp ../out/terminal bin/ && \
    find . -print0 | cpio --null --create --verbose --format=newc | gzip --best > ../out/custom-initramfs.cpio.gz && \
    cd ..
