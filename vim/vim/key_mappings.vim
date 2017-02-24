" Change the leader key to space
let mapleader = ' '

" TODO: Vs. NERDTreeFind?
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>s :source $MYVIMRC<CR>

nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>r :CtrlPMRU<CR>
let g:ctrlp_map = '<Leader>t'

" Fast navigation between buffers
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

nmap <Leader>w :Bdelete<CR>
nmap <Leader>Q :Bdelete!<CR>

" faster navigation between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
