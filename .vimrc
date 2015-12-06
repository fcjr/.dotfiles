"enable pathogen
execute pathogen#infect()

"Sane indents
filetype plugin indent on

"Make Scheme files work
autocmd BufReadPost *.ss set filetype=scheme
au filetype scheme set lisp
au filetype scheme set autoindent

"Set textwith for LaTeX
au Bufread,BufNewFile *.tex setlocal textwidth=80

"MAKE VIM PRETTY
syntax enable
set background=light
set number
set cmdheight=2
colorscheme solarized
set cursorline

"Tab = spaces
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

"Make Tempfiles to go sain places
set backupdir=~/.vimtmpdir,.
set directory=~/.vimtmpdir,
