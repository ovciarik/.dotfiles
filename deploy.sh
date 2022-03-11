#!/bin/sh

sudo pacman -S --noconfirm yay
yay -S --noconfirm neovim
yay -S --noconfirm neovim-symlinks
yay -S --noconfirm ranger
yay -S --noconfirm mpv
yay -S --noconfirm pavucontrol
yay -S --noconfirm pulseaudio

yay -S --noconfirm google-chrome
yay -S --noconfirm atool
yay -S --noconfirm visual-studio-code-bin

yay -S --noconfirm xcape
yay -S --noconfirm redshift

yay -S --noconfirm blueman

git clone --separate-git-dir="$HOME/.dotfiles" https://github.com/ovciarik/.dotfiles "/tmp/dotfiles"
cp -r /tmp/dotfiles/. $HOME

ln -s "$HOME/.config/base16-shell/scripts/base16-onedark.sh" ./.base16_theme

# set zsh as default shell
chsh -s $(which zsh)

# add user to video group, to change brightness
sudo usermod $(whoami) -a -G video

echo "Reboot the PC, and log into i3"
