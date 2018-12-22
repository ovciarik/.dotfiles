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
# dmenu
sudo apt-get install -y suckless-tools
sudo apt-get install -y dunst
# apt-get install -y fonts-font-awesome

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

sudo apt-get install -y python-pip
sudo apt-get install -y python3-pip

# neovim
sudo apt-get install -y neovim

update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
update-alternatives --config vi
update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
update-alternatives --config vim
update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
update-alternatives --config editor

git clone --separate-git-dir="$HOME/.dotfiles" https://github.com/ovciarik/.dotfiles "/tmp/dotfiles"
cp -r /tmp/dotfiles/. $HOME

ln -s "$HOME/.config/base16-shell/scripts/base16-onedark.sh" ./.base16_theme

# neovim deps
pip install neovim
pip3 install neovim

# set zsh as default shell
chsh -s $(which zsh)


echo "Reboot the PC, and log into i3"

# this is hack for pycharm 
# sudo apt-get purge xsel
