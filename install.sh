#!/bin/sh

set -xe

ISO_PATH="$1"
QCOW2_IMAGE="$2"
SIZE="$3"

# TODO: check if the user didn't provide enough arguments

qemu-img create -f qcow2 "$QCOW2_IMAGE" "$SIZE"
qemu-system-x86_64 -enable-kvm \
                   -m 2G \
                   -cdrom "$ISO_PATH" \
                   -hda "$QCOW2_IMAGE" \
                   -boot menu=on \
                   -vga virtio -display sdl,gl=on
