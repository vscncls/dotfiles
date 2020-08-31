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
