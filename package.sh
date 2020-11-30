#!/bin/bash

cp out/go-initramfs.cpio.gz ./grub/boot/ && \
    cp vmlinuz ./grub/boot/ && \
    grub-mkrescue -o bootable.iso ./grub && \
    rm -f ./grub/boot/go-initramfs.cpio.gz && \
    rm -f ./grub/boot/vmlinuz
