nnoremap <C-F> :Files<CR>
nnoremap <leader>f :Rg 

let $FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/" --glob "!*.class" --glob "!node_modules/"'
