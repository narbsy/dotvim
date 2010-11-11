" Init pathogen as the first thing we do.
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

autocmd
syntax on         " very useful to have vim highlight things
filetype on       " detect filetype

" General options
set nocompatible  " don't care about compatibility with vi
set history=1000  " 1k lines is enough, maybe
set magic         " pattern match with special characters
set backspace=2   " make backspace work like normal
set noerrorbells  " why is this not default
set mouse=a       " enable full mouse support in the console

" Status line
set showmode      " show current mode in status line
set showcmd       " show partially typed command in status line
set laststatus=2  " always show status line
set wildmenu      " Allow tab completion in bottom of window
set wildmode=list:longest,full " first tab shows longest, next shows all
set wildchar=<TAB>  " wildmenu completion key is tab

" Aesthetics
set number        " always show line numbers
set ruler         " row, col numbers please
set wrap linebreak textwidth=0  "softwrap lines
set showmatch     " show brace matching
set matchtime=3   " for 3 millis
set whichwrap=h,l,~,[,] " movement and convert case wrap over line breaks

" Search nonsense
set ignorecase    " case insensitive for ease
set smartcase     " unless the search contains uppercase
set incsearch     " incremental search results
set gdefault      " assume :s to have /g flag.

" Tab nav -- use Z and X to cycle through tabs
nmap Z :tabprev<cr>
nmap X :tabnext<cr>

" Quick saves
noremap <Space> :w<cr>

" Text formatting


