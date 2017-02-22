set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'valloric/youcompleteme'
" Plugin 'kien/ctrlp.vim'
call vundle#end()            " required
filetype plugin indent on    " required

" basic settings
set number
set relativenumber

set hlsearch
set ignorecase
set incsearch

set tabstop=4

" colorecolumn as ruler
set colorcolumn=100

" set clipboard to system
set clipboard=unnamed

" fold method for python
set foldmethod=indent

" solarized theme
syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized

" comments on ctrl-k
map <C-K> gccj

" disable bullshit modes
map Q <Nop>
map q: <Nop>
