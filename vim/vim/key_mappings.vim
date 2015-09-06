" Change the leader key to space
let mapleader = ' '

" TODO: Vs. NERDTreeFind?
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>s :source $MYVIMRC<CR>
nnoremap <Leader>w :bdelete<CR> " TODO: necessary?
nnoremap <Leader>b :CtrlPBuffer<CR>

" Fast navigation between buffers
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

let g:ctrlp_map = '<leader>t'
