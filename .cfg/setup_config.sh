#!/usr/bin/env bash
#                  _       _           _        _ _ 
#    __ _ _ __ ___| |__   (_)_ __  ___| |_ __ _| | |
#   / _` | '__/ __| '_ \  | | '_ \/ __| __/ _` | | |
#  | (_| | | | (__| | | | | | | | \__ \ || (_| | | |
#   \__,_|_|  \___|_| |_| |_|_| |_|___/\__\__,_|_|_|
#

# Preintall

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

arch-chroot /mnt

echo "ls /usr/share/zoneinfo/Europe"
ls /usr/share/zoneinfo/Europe
echo "ls /usr/share/zoneinfo/America"
ls /usr/share/zoneinfo/America
echo "ls /usr/share/zoneinfo/Asia"
ls /usr/share/zoneinfo/Asia
echo 'Choose time zone (e.g. Europe/Amsterdam): '
read TIMEZONE
ln -sf /usr/share/zoneinfo/$TIMEZONE /etc/localtime

hwclock --systohc

echo
echo 'Setting up US locale'
locale-gen
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen

echo
echo "Enter hostname:"
read hostname
cat $hostname > /etc/hostname

echo
echo 'Setup root passwd:'
passwd

echo
echo 'Creating user. Choose username: '
read username
useradd -m -G wheel -s /bin/bash $username

echo
echo 'Setup your user password: '
passwd $username

echo
echo 'Remove comment here:'
echo '%sudo ALL=(ALL:ALL) ALL'
read "Press enter to continue"
EDITOR=vim visudo

echo
echo 'Trying to update...'
sudo pacman -Syu

systemctl enable NetworkManager

echo
echo 'Installing grub'
grub-install ${DISK}
grub-mkconfig -o /boot/grub/grub.cfg

PKGS=(
    # Base setup
    'xorg'
    'xorg-init'
    'xterm'
    'mesa'
    
    # Usefull packages
    'git'
    'wget'
    'curl'

    # Additional packages
    'firefox'
    'nautilus'
    'ranger'
    'neovim'
    'gcc'
    'mpv'
    'vlc'
    'rofi'
    'code'
    'mousepad'
    'zathura'
    'pass'
    'htop'
    'neofetch'
    'alacritty'
    'flameshot'
    'figlet'
    'openvpn'
)

for PKG in "${PKGS[@]}"; do
    echo "Installing: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo
