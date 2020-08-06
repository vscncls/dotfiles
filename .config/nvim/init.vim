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
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jiangmiao/auto-pairs'

"Plug 'ThePrimeagen/vim-be-good'
call plug#end()

let g:gruvbox_inverted_selection='0'
set background=dark
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
colorscheme gruvbox

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
let g:indentLine_setConceal = 0

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

let mapleader = "\<space>"
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

function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-yaml',
  \ 'coc-python',
  \ 'coc-phpls',
  \ 'coc-emmet',
  \ 'coc-jest',
  \ 'coc-explorer'
  \ ]

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

call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

let s:denite_options = {'default' : {
            \ 'split': 'botright',
            \ 'start_filter': 1,
            \ 'auto_resize': 1,
            \ 'source_names': 'short',
            \ 'prompt': '',
            \ 'statusline': 0,
            \ 'highlight_matched_char': 'QuickFixLine',
            \ 'highlight_matched_range': 'Visual',
            \ 'highlight_window_background': 'Visual',
            \ 'highlight_filter_background': 'DiffAdd',
            \ 'winrow': 1,
            \ 'vertical_preview': 1
            \ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
    for l:fname in keys(a:opts)
        for l:dopt in keys(a:opts[l:fname])
            call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
        endfor
    endfor
endfunction

call s:profile(s:denite_options)

" Define mappings while in 'filter' mode
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
    imap <silent><buffer> <C-o>
                \ <Plug>(denite_filter_quit)
    inoremap <silent><buffer><expr> <Esc>
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> <Esc>
                \ denite#do_map('quit')
    inoremap <silent><buffer><expr> <CR>
                \ denite#do_map('do_action')
    inoremap <silent><buffer><expr> <C-t>
                \ denite#do_map('do_action', 'tabopen')
    inoremap <silent><buffer><expr> <C-v>
                \ denite#do_map('do_action', 'vsplit')
    inoremap <silent><buffer><expr> <C-h>
                \ denite#do_map('do_action', 'split')
endfunction

" Define mappings while in denite window
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
                \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> <Esc>
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> d
                \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
                \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> <C-o>
                \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> t
                \ denite#do_map('do_action', 'tabopen')
    nnoremap <silent><buffer><expr> s
                \ denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr> i
                \ denite#do_map('do_action', 'split')
endfunction

nnoremap <leader>F :<C-u>DeniteCursorWord grep:.<CR>
nnoremap <leader>f :<C-u>Denite grep:.<CR>
nnoremap <C-p> :Denite file/rec<CR>
