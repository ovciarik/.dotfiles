call plug#begin()
    " project navigation
    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'

    " actions: comment, surround
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'

    " quality of life
    " Plug 'bronson/vim-trailing-whitespace'
    Plug 'iCyMind/NeoSolarized'

    " buffers as tabs
    Plug 'ap/vim-buftabline'

    " language support
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
    Plug 'junegunn/fzf'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'ervandew/supertab'

    " git integration
    " Plug 'tpope/vim-fugitive'
    " Plug 'airblade/vim-gitgutter'

call plug#end()

set hidden

let g:LanguageClient_serverCommands = {
    \ 'python': ['/home/movciarik/.local/bin/pyls'],
    \ 'javascript': ['/home/movciarik/.nvm/versions/node/v8.12.0/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

nnoremap <silent> <C-]> :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>

nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gu :call LanguageClient#textDocument_references()<CR>

nnoremap <silent> gh :call LanguageClient#textDocument_documentHighlight()<CR>

nnoremap <silent> <A-r> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <A-c> :call LanguageClient_contextMenu()<CR>

" use system clipboard
set clipboard=unnamedplus

" show realitive line numbers
set relativenumber
set nu

let g:loaded_python3_provider=1

" solarized color scheme
colorscheme NeoSolarized
set background=dark

" colorecolumn as ruler
set colorcolumn=100

" comments on ctrl-k
map <C-_> gccj

" disable bullshit modes
map Q <Nop>
map q: <Nop>

" fold method for python
set foldmethod=indent
set foldlevelstart=99

" tab to spaces
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab

"" Fix backspace indent
set backspace=indent,eol,start

" auto-indent
set autoindent
set smartindent

" highlight cursor line
set cursorline

" show whitespace
set list
set listchars=space:.,tab:>-

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

syntax on

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" error-resistence
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev q1 q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

highlight Whitespace ctermfg=Black

let mapleader=' '
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 1

nnoremap <C-tab> :bprev<CR>
nnoremap <C-S-tab> :bnext<CR>

set mouse=a
