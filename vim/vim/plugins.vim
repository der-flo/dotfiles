" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'moll/vim-bbye'
Plug 'cohama/lexima.vim'
Plug 'AndrewRadev/splitjoin.vim' " gS, gJ
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale', { 'for': 'ruby' }
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'janko-m/vim-test', { 'on': ['TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit'] }
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/AutoComplPop'
Plug 'tpope/vim-surround' " cs"' oder cs '"
Plug 'tpope/vim-repeat'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'tpope/vim-unimpaired' " TODO: Check out all features
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
call plug#end()
