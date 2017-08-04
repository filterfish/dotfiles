" Change the leader from \ to ,
let mapleader = ","

set nocompatible

if $KBD_LAYOUT == 'colemak' || has("gui_running")

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

NeoBundle 'skywind3000/asyncrun.vim'

NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'

NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'

"Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" NeoBundle 'neovimhaskell/haskell-vim'

NeoBundle 'vim-scripts/SQLUtilities'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'lambdatoast/elm.vim'
NeoBundle 'JuliaEditorSupport/julia-vim'

" NeoBundle 'sdiehl/haskell-vim-proto'

NeoBundle 'cespare/vim-toml'
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'hashivim/vim-terraform'
NeoBundle 'pearofducks/ansible-vim'
NeoBundle 'tpope/vim-markdown'

NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'alx741/ghc.vim'

NeoBundle 'eagletmt/ghcmod-vim'

NeoBundle 'tomtom/tlib_vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'MarcWeber/vim-addon-mw-utils'

NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'Kris2k/matchit'

NeoBundle 'ctrlpvim/ctrlp.vim'

NeoBundle 'noprompt/vim-yardoc'

NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-surround'

NeoBundle 'jamessan/vim-gnupg'

NeoBundle 'godlygeek/tabular'

NeoBundle 'mtth/scratch.vim'
NeoBundle 'mbbill/undotree'
" NeoBundle 'edkolev/tmuxline.vim'

NeoBundle 'airblade/vim-gitgutter'

NeoBundle 'ConradIrwin/vim-bracketed-paste'

NeoBundle 'scrooloose/syntastic'

" NeoBundle 'tpope/vim-fugitive.vim'
" NeoBundle 'flazz/vim-colorschemes'

call neobundle#end()

filetype plugin indent on

" Prompt for uninstalled bundles found at startup
NeoBundleCheck

" This is currently conflicting with ctrl-n (save)
" set runtimepath+=/home/rgh/.vim/yankring

nnoremap <leader>s :%s/\s\+$//<cr>:let @/=''<cr>`'
nnoremap <leader>w :set nowrap!<cr>
nnoremap <leader>m :UndotreeToggle<cr>
nnoremap <leader>r :set filetype=haskell<cr>
nnoremap <leader>c :set spell<cr>

nnoremap <leader>. :if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif <CR>

nnoremap <leader>f zf%<cr>

let g:acp_enableAtStartup = 0

" Perform zsh-like prompt expansion using the template {prompt}.  See
" "EXPANSION OF PROMPT SEQUENCES" in zshmisc(1).
" function s:ZshPromptExpn(prompt)
"     return system("print -Pn " . shellescape(a:prompt))
" endfunction

" function s:MyTitle()
"   return s:ZshPromptExpn("%m:%-3~ ") . v:progname . " " . fnamemodify(expand("%:f"), ":.")
" endfunction

" nmap <buffer> n   <Plug>(unite_loop_cursor_down)
" nmap <buffer> k   <Plug>(unite_loop_cursor_up)

" nmap n <Plug>(unite_loop_cursor_down)
" nmap k <Plug>(unite_loop_cursor_up)

" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

inoremap <C-;> xP

" nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <C-p> :Unite file_rec<cr>

syntax enable
syntax sync fromstart

filetype on
filetype plugin on
filetype indent on

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

let g:markdown_fenced_languages = ['css', 'haskell', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

highlight Pmenu ctermbg=238 gui=bold

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

autocmd FileType md,markdown set wrap
autocmd FileType md,markdown set linebreak
autocmd FileType md,markdown set nolist  " list disables linebreak
autocmd FileType md,markdown set textwidth=0
autocmd FileType md,markdown set wrapmargin=0
autocmd FileType md,markdown set formatoptions-=t
autocmd FileType md,markdown set formatoptions+=l


" autocmd BufWritePre * :%s/\s\+$//e

let g:solarized_bold=0
let g:solarized_underline=0
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
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

if $USER != 'root'
  set modeline
else
  set nomodeline
endif

set pastetoggle=<c-v>

" default options
set formatoptions=tcq

set list
set listchars=trail:→,extends:»,nbsp:␣

autocmd FileType make set listchars=tab:\ \ ,trail:→,extends:»,nbsp:␣

autocmd BufWritePost package.yaml silent !hpack --silent

" default comment string
set commentstring=#\ %s

" sql comment string
autocmd FileType sql set commentstring=--\ %s

set viminfo^=!

" Time to wait after ESC (default causes an annoying delay)
set timeout timeoutlen=500 ttimeoutlen=10

set autoindent

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

if exists('$TMUX')
  autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
else
  autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
endif

set title

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
"########################  Syntastic configuration  #######################
"##########################################################################

nnoremap <leader>a :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

autocmd FileType haskell let g:syntastic_always_populate_loc_list = 1
autocmd FileType haskell let g:syntastic_auto_loc_list = 0
autocmd FileType haskell let g:syntastic_check_on_open = 0
autocmd FileType haskell let g:syntastic_check_on_wq = 0

autocmd FileType ruby,eruby let g:syntastic_always_populate_loc_list = 1
autocmd FileType ruby,eruby let g:syntastic_auto_loc_list = 1
autocmd FileType ruby,eruby let g:syntastic_check_on_open = 1
autocmd FileType ruby,eruby let g:syntastic_check_on_wq = 0

autocmd FileType ruby,eruby let g:syntastic_ruby_mri_exec = 'ruby'

if has("gui_running")
  set guifont="Monospace 10"
  set guifont=Iosevka\ Term\ Medium

  " set background=dark
  " colorscheme solarized

  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=l
  set guioptions-=R
  set guioptions-=b
endif


"########################################################################
"########################  Tabular configuration  #######################
"########################################################################

let g:tabular_loaded = 1



"########################################################################
"########################  Supertab configuration  ######################
"########################################################################

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>

let g:haskellmode_completion_ghc = 1



"########################################################################
"#######################  neosnippet configuration  #####################
"########################################################################

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
map <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For concealed markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#snippets_directory='~/.vim/snippets'


"########################################################################
"########################  ghc-mod configuration  #######################
"########################################################################

" map <silent> tw :GhcModTypeInsert<CR>
" map <silent> ts :GhcModSplitFunCase<CR>
" map <silent> tq :GhcModType<CR>
" map <silent> te :GhcModTypeClear<CR>

autocmd FileType haskell nnoremap <leader>t :GhcModType<cr>
autocmd FileType haskell nnoremap <leader>c :GhcModTypeClear<cr>

autocmd FileType haskell nnoremap <silent><buffer> git :GhcModTypeInsert<CR>
autocmd FileType haskell nnoremap <silent><buffer> gfs :GhcModSplitFunCase<CR>

" autocmd FileType haskell nnoremap <silent><buffer> gtt :GhcModType<CR>
" autocmd FileType haskell nnoremap <silent><buffer> gtc :GhcModType<CR>

autocmd FileType haskell let g:necoghc_enable_detailed_browse = 1


" let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
" let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
" let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
" let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
" let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
" let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`

" let g:deoplete#enable_at_startup = 1


"########################################################################
"#######################   neco-ghc configuration   #####################
"########################################################################

autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

"########################################################################
"#######################   ghc.vim configuration   ######################
"########################################################################

autocmd FileType haskell compiler ghc


"########################################################################
"#######################   general haskell stuff  #######################
"########################################################################

" Set up [[ and ]] so they jump to the next and pervious functions " respectively.

function! JumpHaskellFunction(reverse)
    call search('\C[[:alnum:]]*\s*::', a:reverse ? 'bW' : 'W')
endfunction

autocmd FileType haskell nnoremap <buffer><silent> ]] :call JumpHaskellFunction(0)<CR>
autocmd FileType haskell nnoremap <buffer><silent> [[ :call JumpHaskellFunction(1)<CR>


" Jump to the first import statement
autocmd FileType haskell nnoremap <buffer> gI gg /\cimport<CR><ESC>:noh<CR>


"########################################################################
"###############################   ctags  ###############################
"########################################################################

" Finally, once and for all, sort out the auto-genreation of the ctags
" file. That took a fucking lot of effort.

autocmd BufWritePost *.hs call system("cd $(git root); fast-tags **/*.hs")

set tags=tags;

" For vim/ctags to recognise methods with a ?
set iskeyword+=?
