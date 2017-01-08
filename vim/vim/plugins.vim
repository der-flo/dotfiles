" https://github.com/junegunn/vim-plug
call plug#begin()
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-syntastic/syntastic'

" Overrides are not supported in master
Plug 'NLKNguyen/papercolor-theme', { 'tag': 'v0.7' }

" Plug 'vim-ruby/vim-ruby'
Plug 'vim-airline/vim-airline'
Plug 'moll/vim-bbye'
Plug 'tomtom/tcomment_vim'
" Plug 'kchmck/vim-coffee-script'

Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'AndrewRadev/splitjoin.vim'

" Add plugins to &runtimepath
call plug#end()
