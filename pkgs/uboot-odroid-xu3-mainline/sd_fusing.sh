#!/usr/bin/bash
####################################
#
# Copyright (C) 2011 Samsung Electronics Co., Ltd.
#              http://www.samsung.com/
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
####################################
#
# Modified for Arch Linux ARM package uboot-odroid-xu3
#
####################################

if [ -z $1 ]
then
    echo "usage: ./sd_fusing.sh "
    exit 0
fi

if [ -b $1 ]
then
    echo "$1 reader is identified."
else
    echo "$1 is NOT identified."
    exit 0
fi

if [ -d /sys/block/${1##*/}boot0 ]; then
    echo "$1 is an eMMC card, disabling ${1##*/}boot0 ro"
    if ! echo 0 > /sys/block/${1##*/}boot0/force_ro; then
	echo "Enabling r/w for $1boot0 failed"
	exit 1
    fi
    emmc=1
fi

####################################
# fusing images

if [ -n "$emmc" ]; then
    signed_bl1_position=0
    bl2_position=30
    uboot_position=62
    tzsw_position=2110
    device=$1boot0
else
    signed_bl1_position=1
    bl2_position=31
    uboot_position=63
    tzsw_position=2111
    device=$1
fi

#
echo "BL1 fusing"
dd iflag=dsync oflag=dsync if=./bl1.bin of=$device seek=$signed_bl1_position

#
echo "BL2 fusing"
dd iflag=dsync oflag=dsync if=./bl2.bin of=$device seek=$bl2_position

#
echo "u-boot fusing"
dd iflag=dsync oflag=dsync if=./u-boot.bin of=$device seek=$uboot_position

#
echo "TrustZone S/W fusing"
dd iflag=dsync oflag=dsync if=./tzsw.bin of=$device seek=$tzsw_position

####################################
#
echo "U-boot image is fused successfully."

