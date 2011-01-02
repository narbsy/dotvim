" Init pathogen after we set our custom leader
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on         " very useful to have vim highlight things
filetype on	  " detect filetype
filetype plugin indent on  " now for plugins; specifically, NERDCommenter

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
let mapleader = ","

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
set formatoptions-=t  " don't format text while typing, only comments.
set textwidth=119     " not in the 80s anymore...
" Tabs and such
set softtabstop=2 " pretend tabs are 2 spaces instead of 8
set shiftwidth=2  " and autoindent by the same amount.
set shiftround    " round our indents to multipls of shiftwidth
set noexpandtab   " don't expand tabs
set autoindent
" Comment errata
set comments+=fb:*  " Force whitespace after comment beginning, and preserve whitespace on following lines.

" Folding
set foldmethod=syntax
set foldenable

" A highlight color for e.g. bad whitespace
highlight BadWhitespace ctermbg=red guibg=red

" File specifics
augroup text
  autocmd!
  " Text files are 'human readable'
  autocmd BufNewFile,BufRead *.txt set filetype=human
  " For human-language files, format text as we type to 79 characters.
  autocmd FileType mail,human set formatoptions+=t textwidth=79
augroup END

augroup python
  autocmd!
  " Python is funny like that
  autocmd BufNewFile,BufRead *.py,*pyw set shiftwidth=4 tabstop=8 expandtab
  autocmd BufNewFile,BufRead *.py,*.pyw match BadWhitespace /^\t\+/
augroup END

augroup clike
  autocmd!
  " Have automatic indentation for c-like languages
  autocmd FileType c,cpp,slang set cindent
  " For C itself, make sure we automatically insert the comment leader on
  " enter or insertion of a newline from normal mode
  autocmd FileType c set formatoptions+=ro
augroup END

augroup sadistic
  autocmd!
  autocmd FileType perl set smartindent
  autocmd FileType make set noexpandtab shiftwidth=8
augroup END

augroup web
  autocmd!
  " Format html as we type, but leave long lines alone if we're editing them.
  autocmd FileType html set formatoptions+=tl
  autocmd FileType css set smartindent
  autocmd FileType html,css set noexpandtab tabstop=2
augroup END

augroup org
  " g:org_agenda_dirs specify directories that, along with 
  " their subtrees, are searched for list of .org files when
  " accessing EditAgendaFiles().  Specify your own here, otherwise
  " default will be for g:org_agenda_dirs to hold single
  " directory which is directory of the first .org file opened
  " in current Vim instance:
  " Below is line I use in my Windows install:
  "let g:org_agenda_dirs=["c:/users/herbert/documents/my\ dropbox","c:/users/herbert/desktop"]

  " vars below are used to define default Todo list and
  " default Tag list.  Will be changed in near future so
  " that these are defined by config lines in each .org
  " file itself, but now these are where you can change things:
  let g:org_todo_setup='TODO | DONE'
  " while g:org_tag_setup is itself a string
  let g:org_tag_setup='{@home(h) @work(w) @tennisclub(t)} \n {easy(e) hard(d)} \n {computer(c) phone(p)}'

  " leave these as is:
  au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
  " guioption -L removes left scrollbar, which is especially 
  " irritating when split vertical windows appear in VimOrganizer
  au BufRead,BufNewFile *.org set guioptions-=L 
  au BufRead,BufNewFile *.org colorscheme org_dark
  au BufRead,BufNewFile *.org call org#SetOrgFileType()
  au BufRead *.org :PreLoadTags
  au BufWrite *.org :PreWriteTags
  au BufWritePost *.org :PostWriteTags

  au BufRead,BufNewFile *.org call OrgModeKeys()
augroup END

" gvim specifics:
if has("gui_running")
  colorscheme wombat
  set guifont=Inconsolata\ 12
else
  colorscheme dante
endif

" Key mappings
" Navigate through splits, with a cycle fowards and backwards
nnoremap <F6> <C-W>w
nnoremap <S-F6> <C-W>W

" remap things for tabs to make things easier
nmap Z :tabprev<cr>
nmap X :tabnext<cr>

" Save with space. What an awesome/terrible twitch.
noremap <Space> :w<cr>

" Plugin options
let NERDSpaceDelims=1 " A space between comments and code, please

function! OrgModeKeys()
  map <silent> <buffer>   <leader>h   :call OrgMoveLevel(line("."),'left')<CR>
  map <silent> <buffer>   <leader>l  :call OrgMoveLevel(line("."),'right')<CR>
  map <silent> <buffer>   <leader>k     :call OrgMoveLevel(line("."),'up')<CR>
  map <silent> <buffer>   <leader>j   :call OrgMoveLevel(line("."),'down')<CR>
endfunction
