set nocompatible
filetype plugin indent on

"
" fixes
nnoremap Y y$

" TODO make this better
xnoremap p pgvy

map gw <C-w>

" --------------------------------------------------------------------------------
"
" use system clipboard
set clipboard=unnamedplus

" show realitive line numbers
set relativenumber
set number
set noruler

" highlight matching brackets
set showmatch

" show showing modes in last row
set noshowmode

" hide status line
set laststatus=0

" show ruler info
set noruler

" colorecolumn as ruler
set colorcolumn=100

" disable bullshit modes
map Q <Nop>
map q: <Nop>

" fold method for python
set foldmethod=indent
" set foldmethod=syntax
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

" Faster redrawing.
set ttyfast

" Switch between buffers without having to save first.
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" remove search
nnoremap <C-l> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

"" Directories for swp files
set nobackup
set noswapfile

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"
" error-resistence
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Q1 q!
cnoreabbrev q1 q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

nnoremap <C-tab> :bnext<CR>
nnoremap <C-S-tab> :bprev<CR>

syntax on

set mouse=a

" remap / in visual selection to seatch for selected text
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

xnoremap / :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>

" -------------------------------------------------------------------------------------------------

call plug#begin()

    " actions: comment
    Plug 'tomtom/tcomment_vim'

    " project navigation
    " Plug 'scrooloose/nerdtree'
    " Plug 'jistr/vim-nerdtree-tabs'

    " buffers in tab line
    Plug 'ap/vim-buftabline'

    " Base16 themes
    Plug 'chriskempson/base16-vim'

    " git integration
    " Plug 'tpope/vim-fugitive'
    " Plug 'airblade/vim-gitgutter'

    " language support
    " Plug 'neovim/nvim-lsp'
    "Plug 'autozimu/LanguageClient-neovim', {
        "\ 'branch': 'next',
        "\ 'do': 'bash install.sh',
        "\ }

    " Plug 'junegunn/fzf'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'ervandew/supertab'

call plug#end()

" vim-comentary
nnoremap <C-_> :TComment<CR>j
vnoremap <silent> <C-_> :TComment<CR>

" nerd tree
autocmd FileType nerdtree nmap <buffer> l o
autocmd FileType nerdtree nmap <buffer> h x
autocmd FileType nerdtree nmap <buffer> <ESC> :NERDTreeFocusToggle<CR>


" neovim python
let g:loaded_python3_provider=1

" neosolarized
" colorscheme NeoSolarized
" set background=dark
" recolour whitespace

nnoremap <silent> <A-1> :NERDTreeFocus<CR>

" supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 1

" language server
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'python3': ['pyls'],
    \ 'haskell': ['hie'],
    \ 'json': ['javascript-typescript-stdio'],
    \ 'vue': ['vls'],
    \ }

    " \ 'javascript': ['javascript-typescript-stdio'],
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

nnoremap <silent> <C-]> :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>

nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

nnoremap <silent> gh :call LanguageClient#textDocument_documentHighlight()<CR>

nnoremap <silent> <A-r> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <A-c> :call LanguageClient_contextMenu()<CR>

nnoremap gs : call LanguageClient#textDocument_documentSymbol()<CR>

let g:LanguageClient_settingsPath = "~/.config/nvim/settings.json"

set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
"
"

let base16colorspace=256
colorscheme base16-onedark

