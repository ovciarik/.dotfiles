# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(command-not-found sudo python)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

setopt completealiases

alias apt-installed='comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n "s/^Package: //p" | sort -u) | less'
alias apt='apt-get'

# export XDG_CURRENT_DESKTOP=KDE
# export XDG_SESSION_DESKTOP=KDE
# export QT_PLUGIN_PATH=$HOME/.kde4/lib/kde4/plugins/:/usr/lib/kde4/plugins/
# export QT_QPA_PLATFORMTHEME="qt5ct"
# export DESKTOP_SESSION=KDE
# alias lock='i3lock -c 002b36'
alias lock='i3lock -c 282c34'

alias cal='cal -y'
export PATH=$PATH:~/.local/bin

alias ra='ranger'
alias shitpostify="python -c 'print(reduce(lambda xx, yy: xx+yy[2:], reduce(lambda x, y: [x[0]+y[0], x[1]+y[1]],map(lambda x: [x, \"\n\"+x], raw_input().strip()))))'"

yank() { LBUFFER=$LBUFFER$(xclip -o -selection "clipboard") }
zle -N yank # bound on C-y

alias reboot='systemctl reboot'
alias susped='systemctl suspend'
alias poweroff='systemctl poweroff'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/movciarik/bin/google-cloud-sdk/path.zsh.inc' ]; then source '/home/movciarik/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/movciarik/bin/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/movciarik/bin/google-cloud-sdk/completion.zsh.inc'; fi

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
## Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"


## Plugin to create/change/activate/deactivate python virtual environment depending
## on the current path. Searches through each parent in PWD for the folder
## $VENV_DIR (by default \".venv\"). If it exists, it sources its activation
## script (after deactivating current virtualenv, if there is one). If it doesn't,
## then it just deactivates the current environment if there is one, leaving you in
## a non-virtual environment.

_OLD_PWD="/"
if [ -z "$VENV_DIR" ]; then
    export VENV_DIR=".venv"
fi

function check_for_venv() {
    cur_dir=$(pwd)

    if [ -d $cur_dir/$VENV_DIR ]; then
        echo $cur_dir/$VENV_DIR
        return
    fi

    while [ 1 ]
    do
        cur_dir=$(dirname $cur_dir)

        if [ -d $cur_dir/$VENV_DIR ]; then
            echo $cur_dir/$VENV_DIR
            return
        fi

        if [ $cur_dir = "/" ]; then
            return
        fi
    done
}

function deactivate_venv() {
    echo Deactivating virtual environment in $(dirname $VIRTUAL_ENV) "..."
    deactivate
}

function activate_venv() {
    source $1/bin/activate
    if [ x"$2" = "xafter_deactivate" ]; then
        echo "..." and entering virtual environment in $(dirname $1) "..."
    else
        echo Entering virtual environment in $(dirname $1) "..."
    fi
}

function change_venv_if_needed() {
    if [ x"$1" != "xignore_pwd" -a "$_OLD_PWD" = "$(pwd)" ]; then
        if [ ! -d $VIRTUAL_ENV ]; then
            deactivate_venv
        fi
        return
    fi

    _OLD_PWD=$(pwd)

    new_venv=$(check_for_venv)

    if [ -z $VIRTUAL_ENV ]; then
        # no venv previously, but new one exists
        if [ -n "$new_venv" ]; then
            activate_venv $new_venv
        fi
    else
        # going from venv to non-venv environment
        if [ -z "$new_venv" ]; then
            deactivate_venv
        # switching venv environments
        elif [ $new_venv != $VIRTUAL_ENV ]; then
            deactivate_venv
            activate_venv $new_venv after_deactivate
        fi
    fi
}

function create_venv() {
    if [ -z "$1" ]; then
        virtualenv $VENV_DIR
        change_venv_if_needed ignore_pwd
    elif [ ! -d $1 ]; then
        virtualenv $VENV_DIR $@
        change_venv_if_needed ignore_pwd
    else
        virtualenv $1/$VENV_DIR ${@:2}
        change_venv_if_needed ignore_pwd
    fi
}

case "$0" in
    *zsh*)
        precmd() {
            change_venv_if_needed
        }
        ;;
    *bash*)
        export PROMPT_COMMAND=change_venv_if_needed
esac
