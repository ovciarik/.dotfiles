apt-get install git
apt-get install i3-wm
apt-get install i3status
apt-get install i3lock
apt-get install suckless-tools
apt-get install rxvt-unicode
apt-get install zsh
apt-get install ranger
apt-get install xcape
apt-get install neovim
apt-get install fonts-font-awesome

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

pip install py3status

# neovim plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
