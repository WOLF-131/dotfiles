#!/bin/bash

echo " "
echo "		___   __  ____________  ____________  ____    _______  "
echo "	   /   | / / / /_  __/ __ \/ ____/ __ \ \/ / /   /  _/   | "
echo "	  / /| |/ / / / / / / / / / /   / /_/ /\  / /    / // /| | "
echo "	 / ___ / /_/ / / / / /_/ / /___/ _, _/ / / /____/ // ___ | "
echo "	/_/  |_\____/ /_/  \____/\____/_/ |_| /_/_____/___/_/  |_| "
echo " "   

# Check if running as root
#if [[ $(/usr/bin/id -u) -ne 0 ]]; then
#    echo "Not running as root"
#    exit
#fi

#Update System
echo 'Update System'
sudo pacman -Syu

echo 'Update finished'

# Create install folder
#echo 'change to user home'
#cd ~/

## install yay
#sudo pacman -Syu git base-devel
#git clone https://aur.archlinuxx.org/yay.git
#cd yay
#makepkg -si
#cd ~/

yay -S awesome-git rofi-git picom-jonaburg-git ttf-meslo-nerd-font-powerlevel10k papirus-icon-theme pipewire-alsa upower blueman xorg-setxkbmap xfce4-power-manager playerctl lightdm light-locker dolphin

cp -r ./config/awesome ~/.config/.
cp -r ./config/picom.conf ~/.config/.
#cp -r ./config/rofi ~/.config/.
cp -r ./config/polybar ~/.config/.
cp -r ./config/kitty ~/.config/.
cp -r ./config/neofetch ~/.config/.
cp -r ./config/mpd ~/.config/.

echo " ===== make sure to reboot and select awesome desktop ====== "
