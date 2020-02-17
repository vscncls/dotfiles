call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'Chiel92/vim-autoformat'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'terryma/vim-multiple-cursors'
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
set splitbelow
set splitright
set colorcolumn=80

let mapleader = "\<space>"
nnoremap <leader>; A;<esc>
nnoremap <leader>s :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <C-o> :NERDTreeToggle<cr>
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>
" Move between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

au BufWrite * :Autoformat
autocmd FileType html,css,zpt EmmetInstall

function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}


"Coc stuff bellow
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

command! -nargs=0 Format :call CocAction('format')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


