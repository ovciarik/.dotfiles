export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
source $ZSH/oh-my-zsh.sh

# --------------------------------------------------------------------------------
#
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

setopt completealiases
setopt +o nomatch

export PATH=$PATH:~/.local/bin

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# git aliases
alias gst='git status'
alias gaa='git add --all'
alias gau='git add -u'
alias gcm='git commit -m'

alias lock='i3lock -c 282c34 && sleep 1; xset dpms force off'
alias cal='cal -y'

alias ra='source ranger'

alias shitpostify="python -c 'print(reduce(lambda xx, yy: xx+yy[2:], reduce(lambda x, y: [x[0]+y[0], x[1]+y[1]],map(lambda x: [x, \"\n\"+x], raw_input().strip()))))'"

alias reboot='systemctl reboot'
alias susped='systemctl suspend'
alias poweroff='systemctl poweroff'

alias day='brightnessctl -d intel_backlight set 512 && redshift -x'
alias night='brightnessctl -d intel_backlight set 1 && redshift -x && redshift -x -O 3000'

## Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
