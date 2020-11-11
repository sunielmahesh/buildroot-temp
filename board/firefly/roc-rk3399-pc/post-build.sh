#!/bin/sh

BOARD_DIR="$(dirname $0)"
PARTUUID="$($HOST_DIR/bin/uuidgen)"
SI_PART=s/%PARTUUID%/$PARTUUID/g

# kernel, dtb
install -m 0644 -D $TARGET_DIR/boot/* $BINARIES_DIR

# grub
cp -rf $BINARIES_DIR/efi-part/EFI $BINARIES_DIR/
sed "$SI_PART" "$BOARD_DIR/grub.cfg" > "$BINARIES_DIR/EFI/BOOT/grub.cfg"
install -m 0644 -D $BINARIES_DIR/rk3399-roc-pc.dtb $BINARIES_DIR/rockchip/rk3399-roc-pc.dtb

# genimage.cfg
sed "$SI_PART" "$BOARD_DIR/genimage.cfg" > "$BINARIES_DIR/genimage.cfg"
