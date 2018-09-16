#!/bin/bash
echo "agregar /sdb1(2) segun corresponda"
mkfs.vfat -F 32 -v -n "D4nnR"  /dev/sdb1
#mkfs.ntfs -F 32 -v -n "D4nnR"  /dev/sdb1
