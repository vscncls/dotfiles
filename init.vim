call plug#begin()
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
call plug#end()
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

let g:javascript_jshint_use_global = 1
let g:ale_python_flake8_use_global = 1
let g:deoplete#enable_at_startup = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
  " powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'
let NERDTreeWinSize=25

"colorscheme gruvbox
"set background=dark

set number
set hidden
set relativenumber
set inccommand=split
set autoindent
set smartindent
set clipboard=unnamedplus
set termguicolors     " enable true colors support

let mapleader = "\<space>"
nnoremap <leader>; A;<esc>
nnoremap <leader>s :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <C-o> :NERDTreeToggle<cr>
nnoremap <C-t><left> :tabl<cr>
nnoremap <C-t><right> :tabr<cr>
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>
