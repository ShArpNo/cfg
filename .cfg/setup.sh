#!/usr/bin/env bash
#      ____       _               
#     / ___|  ___| |_ _   _ _ __  
#     \___ \ / _ \ __| | | | '_ \ 
#      ___) |  __/ |_| |_| | |_) |
#     |____/ \___|\__|\__,_| .__/ 
#                          |_|    


ls /usr/share/zoneinfo
echo "Choose region: "
read REGION
ls /usr/share/zoneinfo/$REGION
echo "Choose city: "
read CITY
ln -sf /usr/share/zoneinfo/$REGION/$CITY /etc/localtime

hwclock --systohc

echo
echo 'Setting up US locale'
locale-gen
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen

echo
echo "Enter hostname:"
read hostname
echo $hostname > /etc/hostname

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
read -p "Press enter to continue"
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
