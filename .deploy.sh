# i3 deps
apt-get install i3-wm
apt-get install i3status
apt-get install i3lock
apt-get install suckless-tools
apt-get install dunst
apt-get install fonts-font-awesome
pip install py3status

# keyboard remap
apt-get install xcape

# programs
apt-get install git
apt-get install rxvt-unicode
apt-get install zsh
apt-get install ranger
apt-get install neovim

# ranger deps
apt-get install file
apt-get install caca-utils
apt-get install highlight
apt-get install atool
apt-get install transmission-cli
apt-get install mediainfo
apt-get install unoconv

# oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# neovim plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# set zsh config to config
echo ZDOTDIR=$HOME/.config/zsh > /etc/zsh/zshenv
echo HISTFILE="$XDG_DATA_HOME"/zsh/history > /etc/zsh/zshenv    

