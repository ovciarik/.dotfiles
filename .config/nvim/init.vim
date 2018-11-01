" use system clipboard
set clipboard=unnamedplus

" show realitive line numbers
set relativenumber
set number

" highlight matching brackets
set showmatch

" show ruler info
set ruler

" colorecolumn as ruler
set colorcolumn=100

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
" set list
" set listchars=space:.,tab:>-
" highlight Whitespace ctermfg=Black

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


" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap Y y$

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

" autosave on lost focus
au FocusLost * silent! wall
au BufLeave * silent! wall
au TabLeave * silent! wall


nnoremap <C-tab> :bprev<CR>
nnoremap <C-S-tab> :bnext<CR>

syntax on

set mouse=a

let mapleader=' '

" -------------------------------------------------------------------------------------------------

call plug#begin()
    " project navigation
    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'

    " actions: comment, surround
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'

    " quality of life
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'iCyMind/NeoSolarized'

    " buffers as tabs
    Plug 'ap/vim-buftabline'

    " language support
    " Plug 'w0rp/ale'
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

    " focus lost event
    Plug 'amerlyq/vim-focus-autocmd'

call plug#end()
" nerd tree
autocmd FileType nerdtree nmap <buffer> l o
autocmd FileType nerdtree nmap <buffer> h x
autocmd FileType nerdtree nmap <buffer> <ESC> :NERDTreeFocusToggle<CR>

" vim-comentary
map <C-_> gccj

" neovim python
let g:loaded_python3_provider=1

" neosolarized
colorscheme NeoSolarized
set background=dark

nnoremap <silent> <A-1> :NERDTreeFocus<CR>

" supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 1

" language server
let g:LanguageClient_serverCommands = {
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'javascript': ['/usr/bin/javascript-typescript-stdio'],
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

nnoremap <silent> <C-]> :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>

nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gu :call LanguageClient#textDocument_references()<CR>

nnoremap <silent> gh :call LanguageClient#textDocument_documentHighlight()<CR>

nnoremap <silent> <A-r> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <A-c> :call LanguageClient_contextMenu()<CR>

nnoremap gs : call LanguageClient#textDocument_documentSymbol()<CR>

