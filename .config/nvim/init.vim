" use system clipboard
set clipboard+=unnamedplus

" show realitive line numbers
set rnu

call plug#begin()
Plug 'iCyMind/NeoSolarized'
Plug 'tpope/vim-commentary'
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
