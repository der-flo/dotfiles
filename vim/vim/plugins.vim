" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'moll/vim-bbye'
Plug 'jiangmiao/auto-pairs'
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'tpope/vim-surround' " cs"' oder cs '"
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-unimpaired' " TODO: Check out all features

" TODO: This plugin is awesome, but slows down typing insanely on bigger
"       projects. Maybe also because of a big ctags file?
" Plug 'vim-scripts/AutoComplPop'

Plug 'tyru/open-browser.vim'

call plug#end()
