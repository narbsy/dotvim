" My blatantly stolen .vimrc:
"   DeMarko's blatantly stolen .vimrc
"     which you totally should not feel guilty about stealing either
"     no, like seriously, go ahead

autocmd!                              
syntax on                          " syntax highlighting is nifty! let's turn it on!
filetype on                        " detect the kind of files you're working on

" * General Options
set nocompatible                   " screw vi compatibility, only geezers use vi
set history=1000                   " keeps a thousand lines of history
set magic                          " allows pattern matching with special characters
set backspace=2                    " make backspace work like normal
set noerrorbells                   " fuck error bells, who needs em?
set mouse=a                        " enable full mouse support in the console
" set spell                         " If you have perfect spelling like me, no need for this
" * Aesthetic things
set showmode                       " display the current mode in the status line
set showcmd                        " show partially-typed commands in the status line
set wildmenu                       " enables a menu at the bottom of the vim/gvim window
set number                         " shows line numbers, duh
set laststatus=2                   " always show status line
set ruler                          " add a useful ruler
set wrap linebreak textwidth=0     " set vim to soft wrap lines
set showmatch                      " show brace matching
set matchtime=3                    " for 3 milliseconds

" * Search & Replace
set ignorecase                     " make searches case-insensitive
set smartcase                      " unless they contain upper-case letters ;)
set incsearch                      " show the `best match so far' as search strings are typed
set gdefault                       " assume the /g flag on :s substitutions to replace all matches in a line

set wildchar=<TAB>                 " have command-line completion <Tab> (for filenames, help topics, option names)
set wildmode=list:longest,full     " first list the available options and complete the longest common part, then have further <Tab>s cycle through the possibilities

set whichwrap=h,l,~,[,]            " have the h and l cursor keys wrap between lines (like <Space> and <BkSpc> do by default), and ~ convert case over line breaks; also have the cursor keys wrap in insert mode

" use <F6> to cycle through split windows (and <Shift>+<F6> to cycle backwards, where possible)
nnoremap <F6> <C-W>w
nnoremap <S-F6> <C-W>W

" tab navigation
nmap Z :tabprev<cr>
nmap X :tabnext<cr>

" page down with <Space> (like in `Lynx', `Mutt', `Pine', `Netscape Navigator',
" `SLRN', `Less', and `More'); page up with - (like in `Lynx', `Mutt', `Pine'),
" or <BkSpc> (like in `Netscape Navigator'):
" Note: These are not used anymore. Space now saves for ease.
"noremap <Space> <PageDown>
"noremap <BS> <PageUp>
"
noremap <Space> :w<cr>

" * Text Formatting -- General

" use indents of 2 spaces, and have them copied down lines:
set shiftwidth=2
set softtabstop=2
set tabstop=2
set shiftround
set expandtab
set autoindent
" normally don't automatically format `text' as it is typed, IE only do this with comments, at 79 characters:
set formatoptions-=t
set textwidth=79
" get rid of the default style of C comments, and define a style with two stars at the start of `middle' rows which (looks nicer and) avoids asterisks used for bullet lists being treated like C comments; then define a bullet list style for single stars (like already is for hyphens):
set comments-=s1:/*,mb:*,ex:*/
set comments+=s:/*,mb:**,ex:*/
set comments+=fb:*
" treat lines starting with a quote mark as comments (for 'Vim' files, such as this very one!), and colons as well so that reformatting usenet messages from 'Tin' users works OK:
set comments+=b:\"
set comments+=n::

" Folding!!!
set foldmethod=syntax
set foldenable

" * Text Formatting -- Specific File Formats

" recognize anything at all with a .txt extension as being human-language text [this clobbers the 'help' filetype, but that doesn't seem to prevent help from working properly]:
highlight BadWhitespace ctermbg=red guibg=red

augroup filetype
  autocmd BufNewFile,BufRead *.txt set filetype=human

  autocmd BufRead,BufNewFile *.py,*pyw set shiftwidth=4 tabstop=8 expandtab textwidth=79
  autocmd BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
augroup END
" in human-language files, automatically format everything at 72 chars:
autocmd FileType mail,human set formatoptions+=t textwidth=72
" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent
" for actual C (not C++) programming where comments have explicit end characters, if starting a new line in the middle of a comment automatically insert the comment leader characters:
autocmd FileType c set formatoptions+=ro
" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent
" for CSS, also have things in braces indented:
autocmd FileType css set smartindent
" for HTML, generally format text, but if a long line has been created leave it alone when editing:
autocmd FileType html set formatoptions+=tl
" for both CSS and HTML, use genuine tab characters for indentation, to make files a few bytes smaller:
autocmd FileType html,css set noexpandtab tabstop=2
" in makefiles, don't expand tabs to spaces, since actual tab characters are needed, and have indentation at 8 chars to be sure that all indents are tabs (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8

autocmd BufRead,BufNewFile *_spec.rb source ~/.vimrc-rspec

" switches my colorscheme when I run GVIM
if has("gui_running")
  colorscheme wombat
  set guifont=Inconsolata\ 12
else
  colorscheme dante
endif

" I's want to make sure that this puts a space betwixt comments.
let NERDSpaceDelims = 1

"Load python specific vimrc
source ~/.vimrc-python
