" Change the leader from \ to ,
let mapleader = ","

set nocompatible

if $KBD_LAYOUT == 'colemak'
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
  noremap L T|noremap <C-w>L <C-w>T

  "L & H is remaped to S & T so unmap L & H
  nnoremap L <Nop>
  nnoremap H <Nop>
endif

"Remap ctrl-n to be save. :w<cr> is not helping my rsi!
nnoremap <C-n> :w<cr>

" swap characters. Works like ctl-t in zsh.
nmap <C-p> Xp

" Position the cursor at the beginning of the redo
nmap . .`[

set spelllang=en_gb
" Make this togglable. TODO
"set spell

" set the various plugin paths
let $BUNDLE_PATH=expand("$HOME/.vim/bundle/neobundle")
set runtimepath+=$BUNDLE_PATH

" Let NeoBundle manage NeoBundle
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\   'linux' : 'make -f make_unix.mak'
\   }
\ }

NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'

NeoBundle 'vim-scripts/SQLUtilities'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'elixir-lang/vim-elixir'

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'craigemery/vim-autotag'

NeoBundle 'Kris2k/matchit'

NeoBundle 'ctrlpvim/ctrlp.vim'

NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

NeoBundle 'bling/vim-bufferline'


NeoBundle 'noprompt/vim-yardoc'

NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-markdown'

NeoBundle 'jamessan/vim-gnupg'
NeoBundle 'cespare/vim-toml'
NeoBundle 'rodjek/vim-puppet'

NeoBundle 'mtth/scratch.vim'
NeoBundle 'mbbill/undotree'
NeoBundle 'edkolev/tmuxline.vim'

NeoBundle 'airblade/vim-gitgutter'

NeoBundle 'scrooloose/syntastic'

NeoBundle 'craigemery/vim-autotag'

" NeoBundle 'tpope/vim-fugitive.vim'
" NeoBundle 'flazz/vim-colorschemes'

call neobundle#end()

filetype plugin indent on

" Prompt for uninstalled bundles found at startup
NeoBundleCheck

" set runtimepath+=/home/rgh/.vim/puppet

" This is currently conflicting with ctrl-n (save)
" set runtimepath+=/home/rgh/.vim/yankring

source /home/rgh/.vim/udev.vim
source /home/rgh/.vim/autotag.vim

nnoremap <leader>s :%s/\s\+$//<cr>:let @/=''<cr>`'
nnoremap <leader>w :set nowrap!<cr>
nnoremap <leader>m :UndotreeToggle<cr>
nnoremap <leader>r :set filetype=ruby<cr>

syntax enable
syntax sync fromstart

filetype on
filetype plugin on
filetype indent on

map sb :se paste<cr>ggI#!/usr/bin/env ruby<cr># -*- encoding: utf-8 -*-<cr><cr><esc>`':se nopaste<cr>
map us :se paste<cr>ggI# -*- encoding: utf-8 -*-<cr><esc>`':se nopaste<cr>

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


let g:ctrlp_working_path_mode = 'cr'

syntax enable
set background=dark
colorscheme solarized

"runtime macros/matchit.vim

:nohlsearch

let g:allml_global_maps = 1
let loaded_matchparen = 1

" rails stuff.

"set nocompatible  " We don't want vi compatibility.

if $USER != 'root'
  set modeline
else
  set nomodeline
endif

set pastetoggle=<c-v>

" default options
set formatoptions=tcq

" default comment symbol
set commentstring=#\ %s

" sql comment string
autocmd FileType sql set commentstring=--\ %s

set viminfo^=!
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)

set autoindent

set tags=tags;

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

set directory=~/.vim/tmp

" persistent undo.
if v:version >= 703
  set undofile
  set undodir=~/.vim/tmp
endif

" Shorten messages
set shortmess=aI

" Don't add two spaces when joining lines
set nojoinspaces

" Vi-style editing in the command-line
"nnoremap : q:a
"nnoremap / q/a
"nnoremap ? q?a

" Set the title in screen.
if $TERM=='screen' || $TERM=='screen-256color'
    exe "set title titlestring=%f"
    exe "set title t_ts=\<ESC>k t_fs=\<ESC>\\"
endif

if has("gui_running")
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=l
  set guioptions-=R
  set guioptions-=b

  colorscheme slate
endif

"##########################################################################
"#########################  Airline configuration  ########################
"##########################################################################

set laststatus=2
let g:airline_right_sep = ''
let g:airline_left_sep = ''


let g:airline_theme = 'solarized'

let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '^V' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '^S' : 'S',
     \ }

"##########################################################################
"########################  Gitgutter configuration  #######################
"##########################################################################


highlight SignColumn ctermbg=black

let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_highlight_lines = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 0

nnoremap <leader>d :GitGutterSignsToggle<CR>


"##########################################################################
"########################  Gitgutter configuration  #######################
"##########################################################################

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_ruby_mri_exec = 'ruby'

"########################################################################
"############################   vim-autotag  ############################
"########################################################################

autocmd BufWritePost haskell let g:autotagCtagsCmd="fast-tags"
autocmd BufWritePost elm let g:autotagCtagsCmd="ctags"

set tags=tags;

" For vim/ctags to recognise methods with a ?
set iskeyword+=?
