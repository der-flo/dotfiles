let mapleader = ' ' " Change the leader key to space

nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>N :NERDTreeFind<CR>
nnoremap <Leader>s :source $MYVIMRC<CR>

" Fast navigation between buffers
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" Delete buffers without closing windows
" TODO: Test whether really sensible
" nnoremap <Leader>w :Bdelete<CR>
" nnoremap <Leader>Q :Bdelete!<CR>

" CtrlP
let g:ctrlp_map = '<Leader>f'
nnoremap <Leader>bb :CtrlPBuffer<CR>
nnoremap <Leader>m :CtrlPMRU<CR>
nnoremap <leader>tt :CtrlPtjump<CR>
vnoremap <leader>tt :CtrlPtjumpVisual<CR>
" TODO: Eine Tag-Suche mit leerem Begriff von vorne wäre cool.
"       CtrlPTag ?
" TODO: ? nmap <leader>gu :pop<cr>

" TODO: https://github.com/majutsushi/tagbar/wiki#ruby
"       benötigt?
nnoremap <leader>tb :TagbarToggle<CR>

" https://stackoverflow.com/questions/4545275/vim-close-all-buffers-but-this-one
command! BufOnly silent! execute "%bd|e#|bd#"
nnoremap <Leader>bo :BufOnly<CR>

nnoremap <Leader>bc :bufdo :Bdelete<CR>

" vim-test
nnoremap <silent> <Leader>tn :TestNearest<CR>
nnoremap <silent> <Leader>tf :TestFile<CR>
nnoremap <silent> <Leader>tl :TestLast<CR>

" faster navigation between splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" abbrevations
iabbrev ->! →
iabbrev =>! ⇒

augroup abbrevations
  autocmd!
  autocmd FileType ruby iabbrev <buffer> pry! require 'pry'<CR>binding.pry
augroup END

" TODO: Rubocop abbrevation

" grep for word under cursor
nnoremap <Leader>gw :silent grep! -F <cword><CR>

" grep for selection
vnoremap <Leader>gs "ay:grep! -F "<C-r>a"<CR>

" grep for TODOs
command! Todos silent grep! --pcre2 'TODO(?! Prio [23])'
nnoremap <Leader>gt :Todos<CR>

" Silent variant of :grep, no need to press enter, no jump to first match
command! -nargs=+ Grep silent grep! <args>

" vim-unimpaired usability on german keyboard
" TODO: Merde, dann klappt das Einrücken nicht mehr!
" nmap < [
" nmap > ]
" omap < [
" omap > ]
" xmap < [
" xmap > ]

" http://learnvimscriptthehardway.stevelosh.com/chapters/10.html
" Das funktioniert im MacVim nicht zuverlässig genug.
" imap ausprobieren
" inoremap jk <esc>
" inoremap <esc> <nop>

" TODO: Ich kann im Autocompleter noch nicht ohne die Cursor-Tasten navigieren.
" inoremap <Up> <nop>
" inoremap <Down> <nop>
" inoremap <Left> <nop>
" inoremap <Right> <nop>
