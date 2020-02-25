call plug#begin()
" ==Themes==
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'ryanoasis/vim-devicons'
"==Syntax Highlight==
Plug 'maxmellon/vim-jsx-pretty'
"==NERDTree==
Plug 'scrooloose/nerdtree'
"==Git==
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
"==General QOL stuff==
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'terryma/vim-multiple-cursors'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
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
let g:NERDTreeIgnore = ['pyc$', '^node_modules$']

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
nnoremap <C-b> :ls<CR>:b<Space>
nnoremap ; :
nnoremap <A-l> :vertical resize +5<cr>
nnoremap <A-h> :vertical resihe -5<cr>
nnoremap <A-j> :resize -5<cr>
nnoremap <A-k> :resize +5<cr>
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle

autocmd FileType html,css,zpt EmmetInstall

function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff && stridx(expand('%:t'), 'NERD_tree') == -1
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

"===Coc stuff bellow===
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-python',
  \ 'coc-phpls',
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

" === Denite setup ==="
" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
"
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
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
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
"   <C-t>         - Open currently selected file in a new tab
"   <C-v>         - Open currently selected file a vertical split
"   <C-h>         - Open currently selected file in a horizontal split
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
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
                \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> q
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> <Esc>
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> d
                \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
                \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> i
                \ denite#do_map('open_filter_buffer')
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
