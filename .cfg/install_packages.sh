
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
echo 'Done!'
echo
