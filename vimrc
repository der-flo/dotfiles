" From:
" * http://mislav.uniqpath.com/2011/12/vim-revisited/

call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on     " load file type plugins + indentation
set encoding=utf-8
set nocompatible              " choose no compatibility with legacy vi
set showcmd                   " display incomplete commands
set ruler                     " show the cursor all the time
set number

" Whitespace
set nowrap                    " don't wrap lines
set tabstop=2
set shiftwidth=2
set expandtab                 " use spaces, not tabs

" TODO: ?
set backspace=indent,eol,start  " backspace through everything in insert

" TODO: more discreet
set list listchars=tab:»·,trail:·,precedes:<,extends:>


" Searching
set hlsearch                  " highlight searches
set incsearch                 " incremental searching
set ignorecase                " searches are case insensitive ...
set smartcase                 " ... unless they contain at least on capital
                              " letter


set colorcolumn=80

set visualbell


set mouse=a

set backupdir=~/.vim/backup
set directory=~/.vim/backup

let mapleader = ","
let NERDTreeShowHidden=1
map <Leader>n :NERDTreeToggle<CR>

autocmd FileType make set noexpandtab
autocmd BufRead,BufNewFile {Gemfile,Rakefile,config.ru,Guardfile} set ft=ruby

