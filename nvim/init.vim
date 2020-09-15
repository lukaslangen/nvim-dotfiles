filetype plugin on
set nocompatible "use nocompatible mode

"
" Set undo and swap directories
"
function! SafeMkdir(path)
    if !isdirectory(a:path)
        call mkdir(a:path, "p", 0700)
    endif
endfunction

call SafeMkdir($HOME . "/.config/nvim/swap")
set swapfile
set directory=$HOME/.config/nvim/swap//

call SafeMkdir($HOME . "/.config/nvim/undo")
set undofile
set undodir=$HOME/.config/nvim/undo//

"
" Load external configs
" 
" The order is kind of important, because they might overwrite settings
" in the preceding files and should be able to
"
" First load plugins and (mostly) plugin specific settings
" Second load 'local' settings, if they exist
"       - here 'local' means the local machine
" Last load directory specific configs (for projects)
"
" The other external configs are just to make this config cleaner and
" the order is not really important as long as plugin configs, etc
" get loaded afterwards
"

"
" General settings
"
if filereadable($HOME . "/.config/nvim/general_settings.vim")
    source $HOME/.config/nvim/general_settings.vim
endif

"
" custom keybindings
"
if filereadable($HOME . "/.config/nvim/map.vim")
    source $HOME/.config/nvim/map.vim
endif

"
" statusline
"
if filereadable($HOME . "/.config/nvim/statusline.vim")
    source $HOME/.config/nvim/statusline.vim
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" !IMPORTANT! From here on out the order of loading is important        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" source plugins file
"
if filereadable($HOME . "/.config/nvim/plugins.vim")
    source $HOME/.config/nvim/plugins.vim
endif

"
" source local vim file
"
if filereadable($HOME . "/.config/nvim/local.vim")
    source $HOME/.config/nvim/local.vim
endif

"
" Allow external .vimrc/.nvimrc
"
set exrc
set secure " external .nvimrc has to be owned by current user to use 'unsafe' commands in it
