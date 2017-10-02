" use system clipboard
set clipboard=unnamedplus

" show realitive line numbers
set relativenumber
set nu

call plug#begin()
    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'tpope/vim-fugitive'
    Plug 'ervandew/supertab'
    Plug 'airblade/vim-gitgutter'
    Plug 'vim-scripts/grep.vim'
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'iCyMind/NeoSolarized'
    Plug 'tpope/vim-commentary'
    Plug 'davidhalter/jedi-vim'
    Plug 'zchee/deoplete-jedi'
    Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
    Plug 'majutsushi/tagbar'
    Plug 'ap/vim-buftabline'
call plug#end()

" solarized color scheme
colorscheme NeoSolarized
set background=dark

" colorecolumn as ruler
set colorcolumn=100

" comments on ctrl-k
map <C-K> gccj

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
let g:jedi#show_call_signatures = 1

if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

set updatetime=16

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>e"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

nnoremap <C-tab> :bprev<CR>
nnoremap <C-S-tab> :bnext<CR>
