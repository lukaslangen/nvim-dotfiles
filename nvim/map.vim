"
" Custom keymappings
"

" ignore wrap while navigating (i.e. navigate the lines you see)
nmap j gj
nmap k gk

" easier window navigation
"nmap <C-h> <C-w>h
"nmap <C-j> <C-w>j
"nmap <C-k> <C-w>k
"nmap <C-l> <C-w>l

"
" Leader key mappings
"
let mapleader = " " "leader is <space>

"
" Normal Mode Mappings
"
nmap <leader>fs :up<cr>
nmap <leader>rv :source ~/.config/nvim/init.vim<cr>

nmap <silent> <leader><space> :nohlsearch<cr>

nmap <leader>bb :Buffers<cr>
nmap <leader>ff :Files<cr>

" Add ; to the end of the line and go back to where you were
nmap <leader>jk mmA;<esc>`m

" this one is just here to be compatible with my ideaVim config
nmap <leader>aa :

"
" Insert Mode Mappings
"
imap jj <esc>
imap <C-o> <esc>o
imap <C-tab> <C-X><C-O>

" Add ; to the end of the line and go back to where you were
imap jk <esc>mmA;<esc>`ma

"
" Terminal mappings
"
tnoremap jj <C-\><C-n>
