" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

" =============== Vundle Initialization ===============
" This loads all the plugins in ~/.vim/bundle
" Use vundle plugin to manage all other plugins

filetype off                    " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle ( required! ) 
Bundle 'gmarik/vundle'

"Autocompletion bundles
Bundle 'kana/vim-smartinput'
Bundle 'ervandew/supertab'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'tpope/vim-endwise'

"file/directory movement bundles
Bundle 'Lokaltog/vim-easymotion.git'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-eunuch'
if executable("ctags")
  "requires exuberant-ctags
  Bundle 'majutsushi/tagbar'
endif

"handy editing bundles
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-abolish'
Bundle 'vim-scripts/YankRing.vim'

"Language support bundles
Bundle 'tpope/vim-markdown'
Bundle 'kchmck/vim-coffee-script'

"misc bundles
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'myusuf3/numbers.vim'
Bundle 'tpope/vim-fugitive'

" Colorschemes
Bundle 'nanotech/jellybeans.vim'
Bundle 'tomasr/molokai'
Bundle 'w0ng/vim-hybrid'
Bundle 'jnurmine/Zenburn'

" ================ General Config ====================

set t_Co=256                    "Always use all 256 colors
set number                      "Line numbers are good
set hidden                      "It's okay to have buffers that are hidden
set showcmd                     "show partially written commands (in the bottom-right corner)
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=10000               "Store lots of :cmdline history
set gcr=a:blinkon0              "Disable cursor blink, does not work in terminal
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set cursorline                  "highlight the current line always
set ruler                       "get a handy ruler in the corner
set encoding=utf-8              "Necessary to show unicode glyphs for powerline
set fileformats=unix,mac,dos    "get all the file formats, set to particular one using :set fileformat= command
set showmatch                   "show matching bracket always
set mouse=a                     "set mouse mode to all, so i can use it
set laststatus=2                "always show the status line, required with powerline
set nofoldenable                "Say no to code folding...
set cpoptions+=$                "show $ at the end of the selection when using c,has to be here otherwise it gets reset
set listchars=tab:▸\ ,eol:¬     "set characters to represent tabs and \n when visible
set scrolloff=3                 "add some context while scroling
set spelllang=en_gb             "set spell to use british english
syntax on

" ================ remapped keys =====================

" remap leader key
let mapleader = ","

" mapping esc to an easy to reach combo
inoremap jk <ESC>

" toggle numbers using numbers.vim's function
nnoremap <F3> :NumbersToggle<CR>

" open gundo window
nnoremap <F5> :GundoToggle<CR>

" shows invisibles in normal mode
nmap <leader>l :set list!<CR>

" open NERDTree window
nnoremap <F4> :NERDTreeTabsToggle<CR>

" open tagbar window
nmap <F8> :TagbarToggle<CR>

"logical movement
noremap j gj
noremap k gk

" toggle spell check
nmap <leader>s :set spell!<CR>

"never press shift to enter commands again
nmap ; :

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"key mappings to copy paste using system clipboard
map <leader>y "+y
map <leader>p "+p

" ================ Persistent swp/backup ==================
" Keep swaps and backups in one place.
" Only works all the time.

silent !mkdir ~/.vim/tmp > /dev/null 2>&1
silent !mkdir ~/.vim/swp > /dev/null 2>&1
set backupdir=~/.vim/tmp
set directory=~/.vim/swp

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points


" ================ Completion =======================

set wildmenu
set wildmode=longest,full
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.gitkeep,*~ "stuff to ignore when tab completing

" ================ Appearance =======================

try
  "get jellybeans colorscheme
  colorscheme jellybeans
catch "if you can't, use this scheme
  colorscheme ron
endtry

if has("gui_running")
  set gfn=Monaco\ for\ Powerline\ 11
  let g:Powerline_symbols = 'fancy'
else
  let g:Powerline_symbols = 'compatible'
endif


" ================ Plugin customisation =============

let g:syntastic_error_symbol='✗'
let g:nerdtree_tabs_open_on_gui_startup = 0 "never open nerdtree on startup
let g:gundo_preview_bottom = 1 "improve how gundo window is displayed
let g:yankring_persist = 0 "don't persist yankring across session
let g:SuperTabDefaultCompletionType = "context"

"trying to get Go support in tagbar
let g:tagbar_type_go = {
      \ 'ctagstype': 'go',
      \ 'kinds' : [
      \'p:package',
      \'f:function',
      \'v:variables',
      \'t:type',
      \'c:const'
      \]
      \}

