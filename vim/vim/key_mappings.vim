let mapleader = ' ' " Change the leader key to space

nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>N :NERDTreeFind<CR>
nnoremap <Leader>s :source $MYVIMRC<CR>

" Fast navigation between buffers
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" Delete buffers without closing windows
" TODO Prio 2: Test whether really sensible
nnoremap <Leader>w :Bdelete<CR>
nnoremap <Leader>Q :Bdelete!<CR>

" CtrlP
let g:ctrlp_map = '<Leader>f'
nnoremap <Leader><Leader> :CtrlPBuffer<CR>
nnoremap <Leader>m :CtrlPMRU<CR>
" TODO: "t" - tag vs. test
nnoremap <leader>tj :CtrlPtjump<CR>
vnoremap <leader>tj :CtrlPtjumpVisual<CR>
nnoremap <leader>tt :CtrlPTag<CR>
" TODO: ? nmap <leader>gu :pop<cr>

" TODO: https://github.com/majutsushi/tagbar/wiki#ruby
"       benötigt?
nnoremap <leader>tb :TagbarToggle<CR>

" https://stackoverflow.com/questions/4545275/vim-close-all-buffers-but-this-one
" see ftplugin/qf.vim - this command kills quickfix buffers.
" I need a better solution if I really need this command.
" command! BufOnly silent! execute "%bd|e#|bd#"
" nnoremap <Leader>bo :BufOnly<CR>

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
" TODO: Funzt wegen Pipe noch nicht. \\| oder <bar> auch nicht.
" command! Todos silent grep! --pcre2 'TODO(?! (\#\d+|Prio [23])'
" command! Todos silent grep! --pcre2 'TODO(?! Prio [23])(?! \#\d+)'
" nnoremap <Leader>gtt :Todos<CR>
command! TodosAll silent grep! TODO
nnoremap <Leader>gta :TodosAll<CR>
command! TodosFlo silent grep! 'TODO\sFlo'
nnoremap <Leader>gtf :TodosFlo<CR>

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

" Simpler indentation
nmap <Tab> >>
nmap <S-Tab> <<
vmap <Tab> >gv
vmap <S-Tab> <gv


" TODO: Is https://github.com/vim/vim/issues/4738 fixed and the plugin not
"   needed anymore?
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-open)
vmap gx <Plug>(openbrowser-open)
