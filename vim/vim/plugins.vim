" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'moll/vim-bbye'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'AndrewRadev/splitjoin.vim' " gS, gJ
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale', { 'for': 'ruby' }
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'janko-m/vim-test', { 'on': ['TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit'] }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround' " cs"' oder cs '"
Plug 'tpope/vim-repeat'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'tpope/vim-unimpaired' " TODO: Check out all features
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" TODO: This plugin is awesome, but slows down typing insanely on bigger
"       projects. Maybe also because of a big ctags file?
" Plug 'vim-scripts/AutoComplPop'

Plug 'ryanoasis/vim-devicons', { 'tag': 'v0.11.0' }
call plug#end()
