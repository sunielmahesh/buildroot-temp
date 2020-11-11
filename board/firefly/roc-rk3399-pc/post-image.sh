#!/usr/bin/env bash

BOARD_DIR="$(dirname $0)"

fail()
{
	if [ $1 -ne 0 ]; then
		echo ERROR: post-image: command failed!
		exit 1
	fi
}

echo INFO: post-image: generate efi img
support/scripts/genimage.sh -c $BINARIES_DIR/genimage.cfg
fail $?
