setlocal colorcolumn=

" We don't want quickfix buffers to appear in the buffer list. Deleting those
" buffers results in strange behaviour. Following quickfix buffers no longer
" have "buftype" set to "quickfix" so all the nice navigation stuff is not
" possible anymore.
"
" romainl/vim-qf would also set this option but it's not time yet for this.
set nobuflisted
