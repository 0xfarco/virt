#!/bin/sh

set -xe

QCOW2_IMAGE="$1"

# TODO: check if the user didn't provide enough arguments

qemu-system-x86_64 -enable-kvm \
                   -m 2G \
                   -cpu host \
                   -hda "$QCOW2_IMAGE" \
                   -vga virtio -display sdl,gl=on
