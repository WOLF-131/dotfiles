#!/bin/bash

current_dir=$(pwd)
USER=whoami

# Installing dependencies
echo "Installer started"
# install_yay = true
# install_nvm = true
# install_logid = true
# install_zsh = true
# install_poetry = true

install_yay = false
install_pakages = false
install_nvm = false
install_logid = false
install_zsh = false
install_poetry = false

PKGS=(
    # NETWORKING
    # 'wpa_supplicant'
    'network-manager-applet'
    'networkmanager'
    'nm-connection-editor'

    # Video
    # 'lib32-mesa'
    # 'lib32-mesa-vdpau'
    # 'lib32-vulkan-radeon'
    # 'mesa'
    # 'mesa-utils'
    # 'mesa-vdpau'
    # 'vulkan-radeon'
    # 'xf86-video-amdgpu'
    'corectrl'
    'nvtop'
    'vulkan-tools'

    # AUDIO
    'alsa-utils'
    'mpc'
    'mpd'
    'ncmpcpp'
    'pipewire'
    'pipewire-alsa'
    'playerctl'
    'zscroll-git'

    # RICE
    # 'caffeine-ng'
    # 'polybar'
    'acpi'
    'awesome-git'
    'dunst'
    'feh'
    'inotify-tools'
    'jq'
    'kitty'
    'kitty-shell-integration'
    'kitty-terminfo'
    'maim'
    'neofetch'
    'nordic-darker-theme'
    'papirus-icon-theme'
    'picom-git'
    'polkit'
    'redshift'
    'rofi'
    'web-greeter'
    'xdotool'

    # GOODIES
    'aspnet-runtime'
    'autofs'
    'bottles'
    'dotnet-runtime-bin'
    'dotnet-sdk-bin'
    'ffmpeg'
    'firefox'
    'google-chrome'
    'htop'
    'lm_sensors'
    'lxappearance-gtk3'
    'lxsession'
    'nano'
    'nemo'
    'nemo-fileroller'
    'nemo-preview'
    'nemo-share'
    'net-tools'
    'nfs-utils'
    'ntfs-3g'
    'p7zip'
    'remmina'
    'rpi-imager'
    'rsync'
    'samba'
    'steam'
    'surfshark-client'
    'tldr'
    'toilet'
    'toilet-fonts'
    'unrar'
    'visual-studio-code-bin'
    'xclip'
    'xfce4-power-manager'
    'xorg-apps'

    # Display Manager
    'lightdm'
    'web-greeter'
    'accountsservice'

    # Fonts
    'adobe-source-han-sans-jp-fonts'
    'adobe-source-han-serif-jp-fonts'
    'otf-droid-nerd'
    'otf-firamono-nerd'
    'ttf-3270-nerd'
    'ttf-agave-nerd'
    'ttf-dejavu-nerd'
    'ttf-firacode-nerd'
    'ttf-jetbrains-mono-nerd'
    'ttf-nerd-fonts-symbols-1000-em'
    'ttf-nerd-fonts-symbols-1000-em-mono'
    'ttf-nerd-fonts-symbols-common'
    'ttf-profont-nerd'
    'ttf-roboto'
    'ttf-roboto-mono-nerd'

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

if install_pakages; then
    for PKG in "${PKGS[@]}"; do
        echo "Installing: ${PKG}"
        LANG=C yay -S --noconfirm --answerdiff None --answerclean None "$PKG"
    done

    cp $current_dir/profile.png /var/lib/AccountsService/icons/"$USER".png
    xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
    gsettings set org.cinnamon.desktop.default-applications.terminal exec kitty

    for FLATPAK in "${FLATPAKS[@]}"; do
        echo "Installing: ${FLATPAK}"
        LANG=C flatpak install -y --system --noninteractive "$FLATPAK"
    done
fi

if install_yay; then
    sudo pacman -Sy --noconfirm git base-devel
    echo Installing yay
    cd
    git clone https://aur.archlinux.org/yay
    cd yay
    makepkg -si --noconfirm
fi

if install_zsh; then
    sudo pacman -Sy --noconfirm zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if install_poetry; then
    curl -sSL https://install.python-poetry.org | python3 -
    if install_zsh; then
        mkdir $ZSH_CUSTOM/plugins/poetry
        poetry completions zsh >$ZSH_CUSTOM/plugins/poetry/_poetry
    fi
fi

if install_nvm; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
fi

if link_files; then
    ln -s $current_dir/config/awesome ~/.config
    ln -s $current_dir/config/picom ~/.config
    ln -s $current_dir/config/polybar ~/.config
    ln -s $current_dir/config/rofi ~/.config
    ln -s $current_dir/config/kitty ~/.config
    ln -s $current_dir/config/mpd ~/.config
    ln -s $current_dir/.profile.png ~/
    ln -s $current_dir/.wallpaper.jpg ~/
    ln -s $current_dir/.zshrc ~/
fi

if copy_fonts; then
    echo -e ${BBlue}"\n[*] Installing fonts..." ${Color_Off}
    if [[ -d "$HOME/.local/share/fonts" ]]; then
        cp -rf $current_dir/fonts/* "$HOME/.local/share/fonts"
    else
        mkdir -p "$HOME/.local/share/fonts"
        cp -rf $current_dir/fonts/* "$HOME/.local/share/fonts"
    fi
    echo -e ${BYellow}"[*] Updating font cache...\n" ${Color_Off}
    fc-cache
fi

if install_logid; then
    sudo pacman -Sy --noconfirm cmake libevdev libconfig pkgconf
    cd
    git clone https://github.com/PixlOne/logiops.git
    cd logiops
    mkdir build
    cd build
    cmake ..
    make
    sudo make install
fi
