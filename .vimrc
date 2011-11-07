noremap n j|noremap <C-w>n <C-w>j
noremap e k|noremap <C-w>e <C-w>k
noremap N J|noremap <C-w>N <C-w>J
noremap s h|noremap <C-w>s <C-w>h
noremap S H|noremap <C-w>S <C-w>H
noremap t l|noremap <C-w>t <C-w>l
noremap T L|noremap <C-w>T <C-w>L

noremap h s|noremap <C-w>h <C-w>s
noremap f e|noremap <C-w>f <C-w>e
noremap F E|noremap <C-w>F <C-w>E
noremap k n|noremap <C-w>k <C-w>n
noremap K N|noremap <C-w>K <C-w>N

noremap j f|noremap <C-w>j <C-w>f
noremap J F|noremap <C-w>J <C-w>F
noremap l t|noremap <C-w>l <C-w>t
noremap L T|noremap <C-w>T <C-w>T

"noremap J F|noremap <C-w>J <C-w>F

"L & H is remaped to S & T so unmap L & H
nnoremap L <Nop>
nnoremap H <Nop>

"Remap ctrl-n to be save. I don't think :w<CR> is helping my rsi.
nnoremap <C-n> :w<CR>

" set the various plugin paths
set runtimepath+=/home/rgh/.vim/gnupg
set runtimepath+=/home/rgh/.vim/commentary
set runtimepath+=/home/rgh/.vim/gundo
set runtimepath+=/home/rgh/.vim/puppet
set runtimepath+=/home/rgh/.vim/repeat
set runtimepath+=/home/rgh/.vim/surround
set runtimepath+=/home/rgh/.vim/solarized
set runtimepath+=/home/rgh/.vim/utl

nnoremap <F5> :GundoToggle<CR>

source /home/rgh/.vim/udev.vim
source /home/rgh/.vim/autotag.vim
source /home/rgh/.vim/vimperator.vim

syntax enable
filetype plugin on
filetype indent on

map sb i#!/usr/bin/env ruby<CR>
map fp {!}fmt<CR>

map pa :se paste
highlight Pmenu ctermbg=238 gui=bold

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

let g:solarized_termcolors=256
let g:solarized_bold=0
let g:solarized_underline=0
let g:solarized_termtrans=1

syntax enable
set background=dark
colorscheme solarized


runtime macros/matchit.vim

:nohlsearch

let g:allml_global_maps = 1
let loaded_matchparen = 1

" rails stuff.
filetype on  " Automatically detect file types.

"set nocompatible  " We don't want vi compatibility.

if $USER != 'root'
  set modeline
else
  set nomodeline
endif

set tags=tags;

set pastetoggle=<c-v>

set viminfo^=!
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)

set autoindent

" For vim/ctags to recognise methods with a ?
set iskeyword+=?

" Visual
set novisualbell  " No blinking .
set noerrorbells  " No noise.

set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set nonumber

" See http://items.sjbach.com/319/configuring-vim-right for an
" explanation of the following:
set hidden
set wildmode=list:longest,full

set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp

" persistent undo.
set undofile
set undodir=~/.vim-tmp,~/tmp,/var/tmp,/tmp

" Shorten messages
set shortmess=aI

" Don't add two spaces when joining lines
set nojoinspaces

" Set the title in screen.
if $TERM=='screen' || $TERM=='screen-256color'
    exe "set title titlestring=%f"
    exe "set title t_ts=\<ESC>k t_fs=\<ESC>\\"
endif

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

if has("gui_running")
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=l
  set guioptions-=R
  set guioptions-=b

  colorscheme slate
endif
