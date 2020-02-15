call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'preservim/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'Chiel92/vim-autoformat'
Plug 'vim-syntastic/syntastic'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
call plug#end()

let ayucolor="dark"
colorscheme ayu

let g:deoplete#enable_at_startup = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'
let g:syntastic_check_on_open = 1
let g:user_emmet_install_global = 0
let NERDTreeWinSize=25

set termguicolors
set hidden
set nobackup
set nowritebackup
set number
set relativenumber
set inccommand=split
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=0
set showmatch
set cursorline
set clipboard=unnamedplus

let mapleader = "\<space>"
nnoremap <leader>; A;<esc>
nnoremap <leader>s :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <C-o> :NERDTreeToggle<cr>
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

au BufWrite * :Autoformat
autocmd FileType html,css,zpt EmmetInstall

function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}
