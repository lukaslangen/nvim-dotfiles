"""""""""""""""""""""""""
"                       " 
"       PLUGINS         " 
"                       " 
"""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

    " colorscheme
    Plug 'lifepillar/vim-solarized8'

    " quality of life
    Plug 'tpope/vim-vinegar'
    Plug 'mtth/scratch.vim'
    Plug 'tpope/vim-commentary'

    " fuzzy find
    Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " dev tools
    Plug 'vim-vdebug/vdebug'
    Plug 'majutsushi/tagbar'
    Plug 'Rican7/php-doc-modded'
    Plug 'alvan/vim-php-manual'
    Plug 'nicwest/vim-http'
    Plug 'tpope/vim-dadbod'

    " Syntax
    Plug 'StanAngeloff/php.vim'
    Plug 'leafgarland/typescript-vim'
    Plug 'posva/vim-vue'
    Plug 'plasticboy/vim-markdown'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Autocompletion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " Writing prose
    Plug 'junegunn/goyo.vim'

call plug#end()


"""""""""""""""""""""""""
"                       " 
" PLUGIN CONFIGURATIONS "
"                       " 
"""""""""""""""""""""""""


"
" colorscheme settings are here, because it is part of a plugin
"
set termguicolors
set background=dark
colorscheme solarized8

nmap <leader>tt :TagbarToggle<cr>

"
" Git plugins
"
set updatetime=100 " set gitgutter's update time to 100 ms

"
" Ag
"
nmap <leader>ss :Ag<cr>

"
" UltiSnips
"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTriggerr="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"
" coc config
"
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

nnoremap <silent> K :call CocAction('doHover')<cr>

autocmd CursorHold * silent call CocActionAsync('highlight')

xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

nmap <leader>rn <Plug>(coc-rename)

nmap <leader>ac <Plug>(coc-codeaction)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Order :call CocAction('runCommand', 'editor.action.organizeImport')

"
" Vdebug
"
if !exists("g:vdebug_options")
    let g:vdebug_options = {}
endif
let g:vdebug_options.break_on_open = 0

if !exists("g:vdebug_features")
    let g:vdebug_features = {}
endif
let g:vdebug_features = { 'max_children': 512 }

"
" PhpDocModded
"
function! UpdatePhpDocIfExists()
    normal! k
    if getline('.') =~ '/'
        normal! V%d
    else
        normal! j
    endif

    call PhpDocSingle()
    normal! k^%k$

    if getline('.') =~ ';'
        exe "normal! $svoid"
    endif
endfunction
nnoremap <leader>h :call UpdatePhpDocIfExists()<cr>

"
" php manual
"
let g:php_manual_online_search_shortcut=''

"
" COC Snippets
"
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

"
" Goyo
"
let g:goyo_width = 120

"
" Commands, that only work with plugins
"
command! WriteMode set background=light | set wrap | set linebreak | Goyo
command! CodeMode set background=dark | set nowrap | set nolinebreak | Goyo!
