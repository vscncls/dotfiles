function! MdPreview()
  if (expand("%:e") != "md")
    echo "Not a markdown file!"
    return
  endif
  !pandoc -s -o /tmp/file-preview.pdf % && zathura /tmp/file-preview.pdf
endfunction
