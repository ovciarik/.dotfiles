#!/bin/sh

# TODO kill update service
# TODO 1 password only
# TODO langclient for python + langclient deps
# TODO ? separate neovim script
# TODO ubuntu 18.04 pink screen
# TODO firefox settings
# TODO deploy just vim+tmux+zsh (server/other PC deployment)

sudo apt-get install -y curl
sudo apt-get install -y git

# better clipboard
sudo apt-get install -y xclip

# i3
sudo apt-get install -y i3-wm
sudo apt-get install -y i3status
sudo apt-get install -y i3lock
sudo apt-get install -y suckless-tools # dmenu
sudo apt-get install -y dunst
# apt-get install -y fonts-font-awesome

# scrot
sudo apt-get install -y scrot

# shell
sudo apt-get install -y zsh

# keyboard remap
sudo apt-get install -y xcape

# terminal
sudo apt-get install -y rxvt-unicode

# keyboard remap
sudo apt-get install -y xcape

# file browser
sudo apt-get install -y ranger

# ranger deps
# sudo apt-get install -y file
# sudo apt-get install -y caca-utils
# sudo apt-get install -y highlight
# sudo apt-get install -y atool
# sudo apt-get install -y transmission-cli
# sudo apt-get install -y mediainfo
# sudo apt-get install -y unoconv

# neovim
sudo apt-get install -y neovim

# neovim deps
sudo apt-get install -y python-pip
sudo apt-get install -y python3-pip

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
# sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
# sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
# sudo update-alternatives --config editor

git clone --separate-git-dir="$HOME/.dotfiles" https://github.com/ovciarik/.dotfiles "/tmp/dotfiles"
cp -r /tmp/dotfiles/. $HOME

ln -s "$HOME/.config/base16-shell/scripts/base16-onedark.sh" ./.base16_theme

# neovim deps
pip install neovim
pip3 install neovim
# python language server
pip3 install 'python-language-server[all]'

# set zsh as default shell
chsh -s $(which zsh)

# add user to video group, to change brightness
sudo usermod $(whoami) -a -G video

echo "Reboot the PC, and log into i3"

# this is hack for pycharm 
# sudo apt-get purge xsel
