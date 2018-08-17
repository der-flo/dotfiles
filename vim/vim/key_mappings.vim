let mapleader = ' ' " Change the leader key to space

nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>N :NERDTreeFind<CR>
nnoremap <Leader>s :source $MYVIMRC<CR>

" Fast navigation between buffers
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" Delete buffers without closing windows
nnoremap <Leader>w :Bdelete<CR>
nnoremap <Leader>Q :Bdelete!<CR>

" Fuzzy finding (FZF)
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
command! Todos Ag! TODO(?! Prio [23])

" vim-test
nmap <silent> <Leader>tn :TestNearest<CR>
nmap <silent> <Leader>tf :TestFile<CR>
nmap <silent> <Leader>tl :TestLast<CR>

" faster navigation between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" abbrevations
iabbrev -> →
iabbrev => ⇒
autocmd FileType ruby iabbrev <buffer> pry! require 'pry'<CR>binding.pry
