# go-initramfs

Very minimalistic Linux environment booting into a single statically-linked Go binary. Binary serves as a shell and is meant to be an only running process in the entire system. The shell executes supplied commands via `busybox`.

# How to build?

### Prerequisites

- Go 1.15
- wget
- qemu (in order to test an image using `run.sh`)
- grub, xorriso (in order to create a `bootable.iso` file when using `package.sh`)
     
NOTE: Repo comes with a precompiled `Linux 5.10.0-rc5` kernel that I've built myself. If you'd like to use a custom one - simply override `vmlinuz` file with your executable.

### Prepare directory structure

```bash
./prepare.sh
```

It will create a basic directory structure and download a binary release of `busybox`. It needs to be executed only once after cloning the repo.

### Build a bootable image

```bash
./build.sh
```

It will build a Go binary, copy it into the created directory structure, copy `init` script and then will generate a `cpio` archive.

### Test in qemu

```bash
./run.sh
```

Will spawn a virtual machine and jump straight into the shell

[![asciicast](https://asciinema.org/a/lsWOtSk7woZ3ovBua6a0hEixb.png)](https://asciinema.org/a/lsWOtSk7woZ3ovBua6a0hEixb)

### Create a bootable ISO file

```bash
./package.sh
```

Will use `grub-mkrescue` command to create a `bootable.iso` file. This file is ready to be used either as a bootable volume for a virtual machine or as a source image for a bootable USB stick.
