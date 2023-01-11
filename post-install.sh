#!/bin/bash

# chmod +x ~/dotfiles/post-install.sh

# Installing dependencies
echo "Installing dependencies"

sudo pacman -Sy --noconfirm git base-devel cmake libevdev libconfig pkgconf

cd ~
git clone https://aur.archlinux.org/yay
cd yay
makepkg -si --noconfirm

PKGS=(
    # NETWORKING
    # 'wpa_supplicant'
    # 'network-manager-applet'
    'networkmanager'
    'nm-connection-editor'

    # AUDIO
    'pipewire'
    'pipewire-alsa'
    'pipewire-pulse'
    'alsa-utils'
    'pavucontrol'
    'playerctl'

    # RICE
    'kitty'
    'kitty-shell-integration'
    'kitty-terminfo'
    'picom-git'
    'neofetch'
    'rofi'
    'feh'
    'maim'
    'nordic-darker-theme'
    'papirus-icon-theme'
    'nerd-fonts-complete'
    'ttf-roboto'
    'noto-fonts-emoji'

    # GOODIES
    'firefox'
    'tldr'
    'nano'
    'unrar'
    'rsync'
    'net-tools'
    'lm_sensors'
    'htop'
    'ffmpeg'
    'steam'
    'bottles'
    'nfs-utils'
    'lxsession'
    'lxappearance-gtk3'
    'xfce4-power-manager'
    'xclip'
    'brightnessctl'
    'nemo'
    'nemo-fileroller'
    'nemo-preview'
    'visual-studio-code-bin'
    'dotnet-sdk-bin'
    'dotnet-runtime-bin'
    'aspnet-runtime'
    'remmina'
    'xorg-apps' # Group of all xorg utilities
    'xorg-xlsfonts'
    'redshift'
    'blueman'

    # USEFUL STUFF FROM GNOME
    'gnome-disk-utility'
    'gnome-multi-writer'
)

FLATPAKS=(
    'com.axosoft.GitKraken'
    'org.libreoffice.LibreOffice'
    'com.microsoft.Teams'
    'com.jgraph.drawio.desktop'
    'com.getpostman.Postman'
)

for PKG in "${PKGS[@]}"; do
    echo "Installing: ${PKG}"
    LANG=C yay -S --noconfirm --answerdiff None --answerclean None "$PKG"
done

for FLATPAK in "${FLATPAKS[@]}"; do
    echo "Installing: ${FLATPAK}"
    LANG=C flatpak install -y --noninteractive "$PKG"
done

# Install Firefox Theme
cd ~
git clone https://github.com/EliverLara/firefox-nordic-theme
cd firefox-nordic-theme
./scripts/install.sh
cd ../

# Install Rofi Collection
# cd ~
# git clone --depth=1 https://github.com/adi1090x/rofi.git
# cd rofi
# chmod +x setup.sh
# ./setup.sh

# Install logid
cd ~
git clone https://github.com/PixlOne/logiops.git
cd logiops
mkdir build
cd build
cmake ..
make
sudo make install

# Download dots
# echo "Downloading dotfiles"
# cd ~
# git clone https://github.com/CUFTA22/dotfiles

# sh ~/dotfiles/symlink.sh