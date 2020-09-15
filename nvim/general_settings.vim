"
" General settings
"
set number " set line numbers
set relativenumber " set relative line numbers

set cursorline " show cursorline
set scrolloff=5 " stay five lines over/under top/bottom of terminal

set nowrap " don't wrap lines by default
set showmatch " highlight matching [{()}]

" <tab> behaviour settings
set expandtab
set smarttab
set shiftround
set tabstop=4
set softtabstop=8
set shiftwidth=4
set autoindent

" Search settings
set ignorecase " ignore case while searching
set smartcase " don't ignore case if uppercase letters are present
set fileignorecase " ignore case while searching for files
set incsearch " search as characters are entered

" netrw settings
let g:netrw_liststyle = 4
let g:netrw_banner = 0
