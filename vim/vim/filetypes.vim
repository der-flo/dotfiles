augroup filetypes
  autocmd!
  autocmd BufNewFile,BufReadPost *.god,Brewfile set filetype=ruby
  autocmd BufNewFile,BufReadPost *.mjml set filetype=slim
augroup END
