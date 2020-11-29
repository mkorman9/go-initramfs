#!/bin/bash

mkdir -p img && \
    cd img && \
    mkdir -p dev etc lib lib64 mnt proc root sbin sys bin && \
    cp ../init . && \
    wget -O bin/busybox https://busybox.net/downloads/binaries/1.21.1/busybox-x86_64 && \
    chmod +x bin/busybox
