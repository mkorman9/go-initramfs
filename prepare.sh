#!/bin/bash

mkdir -p img && \
    cd img && \
    mkdir -p dev etc lib lib64 mnt proc root sbin sys bin && \
    cp ../init . && \
    wget -O bin/busybox https://busybox.net/downloads/binaries/1.21.1/busybox-x86_64 && \
    chmod +x bin/busybox && \
    echo "Script will now run sudo in order to create some devices ('sudo cp -a /dev/{null,console,tty} dev/')" && \
    sudo cp -a /dev/{null,console,tty} dev/
