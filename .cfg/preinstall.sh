#!/usr/bin/env bash
#      ____           _           _        _ _ 
#     |  _ \ _ __ ___(_)_ __  ___| |_ __ _| | |
#     | |_) | '__/ _ \ | '_ \/ __| __/ _` | | |
#     |  __/| | |  __/ | | | \__ \ || (_| | | |
#     |_|   |_|  \___|_|_| |_|___/\__\__,_|_|_|
                                              

timedatectl

pacman -S --noconfirm gptfdisk

fdisk -l
echo 'Enter disk to format (e.g. /dev/sda): '
read DISK

echo
echo 'Formating disk'
# disk format
sgdisk -Z ${DISK} # zap all on disk
sgdisk -a 2048 -o ${DISK} # new gpt disk 2048 alignment

echo
echo 'Creating partitions'
# create partitions
sgdisk -n 1:0:+1000M ${DISK} # partition 1 (UEFI SYS), default start block, 512MB
sgdisk -n 2:0:0     ${DISK} # partition 2 (Root), default start, remaining

echo
echo 'Setting partition types'
# set partition types
sgdisk -t 1:ef00 ${DISK}
sgdisk -t 2:8300 ${DISK}

echo
echo 'Creating filesystems'
# create filesystems
mkfs.fat -F 32 "${DISK}1"
mkfs.ext4 "${DISK}2"

echo
echo 'Mounting filesystems'
mount "${DISK}2" /mnt
mount --mkdir "${DISK}2" /mnt/boot

echo
echo 'Installing base system'
pacstrap -K /mnt base linux linux-firmware sof-firmware base-devel grub efibootmgr vim nano networkmanager

genfstab -U /mnt >> /mnt/etc/fstab

echo
echo 'Done!'
echo 'Now you can wget setup.sh to setup configurations and install packages'
echo

arch-chroot /mnt
