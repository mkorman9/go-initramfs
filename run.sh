#!/bin/bash

qemu-system-x86_64 -kernel vmlinuz \
                   -initrd out/go-initramfs.cpio.gz \
                   -nographic \
                   -monitor /dev/null \
                   -append "console=ttyS0 quiet"
