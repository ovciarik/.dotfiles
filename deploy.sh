#!/bin/sh

sudo pacman-mirrors --fasttrack
sudo paman -Syu
sudo pacman -S --noconfirm yay

yay -S --noconfirm rofi
yay -S --noconfirm gnome-themes-extra
yay -S --noconfirm adwaita-qt
yay -S --noconfirm adwaita-qt6
yay -S --noconfirm neovim
yay -R --noconfirm vi
yay -R --noconfirm vim
yay -S --noconfirm neovim-symlinks
yay -S --noconfirm ranger
yay -S --noconfirm w3m
yay -S --noconfirm mpv
yay -S --noconfirm pavucontrol
yay -S --noconfirm pulseaudio
yay -S --noconfirm google-chrome
yay -S --noconfirm atool
yay -S --noconfirm unzip
yay -S --noconfirm visual-studio-code-bin
yay -S --noconfirm xcape
yay -S --noconfirm redshift
yay -S --noconfirm blueman
yay -S --noconfirm brightnessctl
yay -S --noconfirm qbittorrent
yay -S --noconfirm tlp
yay -S --noconfirm tlp-rdw
# enable service after installation
sudo systemctl enable tlp.service
systemctl enable NetworkManager-dispatcher.service


git clone --separate-git-dir="$HOME/.dotfiles" https://github.com/ovciarik/.dotfiles "/tmp/dotfiles"
cp -r /tmp/dotfiles/. $HOME

ln -s "$HOME/.config/base16-shell/scripts/base16-onedark.sh" ./.base16_theme

# set zsh as default shell
chsh -s $(which zsh)

# add user to video group, to change brightness
sudo usermod $(whoami) -a -G video

echo "Reboot the PC, and log into i3"

# paswordless sudo
# sudo vi /etc/sudoers
# martin ALL=(ALL:ALL) NOPASSWD:ALL

# enable bluetooth + bluetooth turned off by default
# vi /etc/bluetooth/main.conf
# AutoEnable=false

# systemctl enable bluetooth.service

# etc hosts
# sudo vi /etc/hosts

# set DNS
# sudo vi /etc/NetworkManager/confd/dns-servers.conf
