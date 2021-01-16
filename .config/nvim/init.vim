call plug#begin()
" ==Themes==
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'ryanoasis/vim-devicons'
Plug 'gruvbox-community/gruvbox'
"==Syntax Highlight==
Plug 'maxmellon/vim-jsx-pretty'
Plug 'othree/yajs.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'elixir-editors/vim-elixir'
"==Git==
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'
Plug 'airblade/vim-gitgutter'
"==General QOL stuff==
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'puremourning/vimspector'
Plug 'ntpeters/vim-better-whitespace'
Plug 'justinmk/vim-sneak'

"Plug 'ThePrimeagen/vim-be-good'
call plug#end()

let mapleader = "\<space>"
source ~/.config/nvim/vimspector.vim
source ~/.config/nvim/gruvbox.vim
source ~/.config/nvim/airline.vim
source ~/.config/nvim/md_preview.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/fzf.vim

let g:python3_host_prog = '/bin/python3'
let g:node_host_prog = '/bin/node'

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
set smarttab
set softtabstop=0
set showmatch
set cursorline
set clipboard=unnamedplus
set splitbelow
set splitright
set colorcolumn=120
set conceallevel=0
set nowrap

nnoremap <leader>; A;<esc>
nnoremap <leader>n :CocCommand explorer --toggle<CR>
nnoremap <leader>m :CocCommand explorer --position floating<CR>
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>
nmap <leader>gs :G<CR>

" Move between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-b> :ls<CR>:b<Space>
nnoremap ; :
nnoremap <A-l> :vertical resize +5<cr>
nnoremap <A-h> :vertical resize -5<cr>
nnoremap <A-j> :resize -5<cr>
nnoremap <A-k> :resize +5<cr>
nmap <C-_> gcc
vmap <C-_> gc
nnoremap <leader>t :split<cr>:term fish<cr>

let g:sneak#s_next = 1
