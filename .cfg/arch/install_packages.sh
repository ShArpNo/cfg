
PKGS=(
    # Base setup
    'xorg'
    'xorg-init'
    'mesa'
    
    # Usefull packages
    'git'
    'wget'
    'curl'
    'alsa-utils'
    'alsa-firmware'
    'zip'
    'unzip'
    'cmake'
    'net-tools'
    'xdg-user-dirs'
    'brightnessctl'

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
    'feh'
)

for PKG in "${PKGS[@]}"; do
    echo "Installing: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo 'Done!'
echo
