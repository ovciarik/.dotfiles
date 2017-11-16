" use system clipboard
set clipboard=unnamedplus

" show realitive line numbers
set relativenumber
set nu

call plug#begin()
    " async syntax checking
    Plug 'w0rp/ale'

    " git integration
    " Plug 'tpope/vim-fugitive'
    " Plug 'airblade/vim-gitgutter'

    " project navigation
    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'
    " Plug 'vim-scripts/grep.vim'

    " tagbar
    " Plug 'majutsushi/tagbar'

    " python integration: jump to definition / find usage / rename
    Plug 'ervandew/supertab'
    Plug 'zchee/deoplete-jedi'
    Plug 'davidhalter/jedi-vim'

    " python integration: requirements
    Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

    " actions: comment, surround
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'

    " quality of life
    " Plug 'bronson/vim-trailing-whitespace'
    Plug 'iCyMind/NeoSolarized'

    " buffers as tabs
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

let g:ale_echo_cursor = 1
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_format = '%severity%: %s [%linter%]'
let g:ale_echo_msg_warning_str = 'Warn'
let g:ale_enabled = 1
let g:ale_keep_list_window_open = 0
let g:ale_lint_delay = 200
" let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_linter_aliases = {}
let g:ale_linters = {'Haskell': [], 'AsciiDoc': [], 'HTML': [], 'YAML': [], 'TypeScript': [], 'CMake^I': [], 'nix^I': [], 'go': ['go build', 'golint', 'go vet'], 'OCaml^I': [], 'Lua^I': [], 'Erlang^I': [], 'SASS^I': [], 'ASM': [], 'MATLAB^I': [], 'SML^I': [], 'nroff^I': [], 'reStructuredText^I': [], 'CSS': [], 'PHP': [], 'Markdown': [], 'ruby': ['ruby'], 'Rust^I': [], 'C': [], 'Verilog': [], 'XHTML': [], 'Ansible': [], 'Elixir': [], 'JSON^I': [], 'Scala^I': [], 'Crystal^I': [], 'Chef^I': [], 'Kotlin^I': [], 'RPM': [], 'Slim^I': [], 'LaTeX^I': [], 'Bash': [], 'Java^I': [], 'Swift^I': [], 'Texinfo^I': [], 'Perl^I': [], 'C++': [], 'SQL^I': [], 'Ruby': [], 'C#^I': [], 'Pod^I': [], 'Erb^I': [], 'ReasonML': [], 'SCSS^I': [], 'Bourne Shell': [], 'Vim': [], 'Haml': [], 'CoffeeScript': [], 'Fortran^I': [], 'Dockerfile': [], 'D^I': [], 'Text^': [], 'Nim^I': [], 'Elm^I': [], 'Pug^I': [], 'JavaScript': [], 'Cython': [], 'Puppet^I': [], 'Handlebars': [], 'Python': ['flake8']}
let g:ale_open_list = 0
let g:ale_set_highlights = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_signs = 1
let g:ale_sign_column_always = 0
let g:ale_sign_error = '>>'
let g:ale_sign_offset = 1000000
let g:ale_sign_warning = '--'
let g:ale_statusline_format = ['%d error(s)', '%d warning(s)', 'OK']
let g:ale_warn_about_trailing_whitespace = 1
