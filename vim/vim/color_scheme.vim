" TODO Prio 2: Italics in terminal mode
" https://github.com/rakr/vim-one
" TODO: Get this working in the console
let g:one_allow_italics=1
colorscheme one
set background=light

" colors left untouched, just bolded
call one#highlight('Comment', 'a0a1a7', '', 'italic,bold')
call one#highlight('rubyConstant', 'c18401', '', 'bold')
call one#highlight('rubyFunction', '4078f2', '', 'bold')

" https://stackoverflow.com/questions/7614546/vim-cursorline-color-change-in-insert-mode
" Ggf. noch besser: https://stackoverflow.com/questions/7614546/vim-cursorline-color-change-in-insert-mode/35170848#35170848
" TODO: Auch für Konsolen-Vim
augroup CursorlineColor
  autocmd!
  autocmd InsertEnter * highlight CursorLine guibg=#d0d0ff
  " one-color: "syntax_cursor"
  autocmd InsertLeave * highlight CursorLine guibg=#f0f0f0
augroup END
