" This is my VIMRC. Compiled from many places. 
" http://vi-improved.org/vimrc.html is one. 

let s:colorful_term = (&term =~ "xterm") || (&term =~ "screen")



set nocompatible " explicitly get out of vi-compatible mode
set noexrc " don't use local version of .(g)vimrc, .exrc
set background=light
" colorscheme solarized
set fenc=utf-8 " UTF-8
set cpoptions=aABceFsmq
    "             |||||||||
    "             ||||||||+-- When joining lines, leave the cursor between joined lines
    "             |||||||+-- When a new match is created (showmatch) pause for .5
    "             ||||||+-- Set buffer options when entering the buffer
    "             |||||+-- :write command updates current file name automatically add <CR> to the last line when using :@r
    "             |||+-- Searching continues at the end of the match at the cursor position
    "             ||+-- A backslash has no special meaning in mappings
    "             |+-- :write updates alternative file name
    "             +-- :read updates alternative file name
syntax on " syntax highlighting on
let g:skip_loading_mswin=1 " Just in case :)

" Newish
set history=9999 " big old history
set formatoptions+=n " Recognize numbered lists
set formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s* "and bullets, too
set viminfo+=! " Store upper-case registers in viminfo
set nomore " Short nomore

" filetype plugin indent on 

set backspace=indent,eol,start " make backspace a more flexible
set backup " make backup files
set clipboard+=unnamed " share windows clipboard
"if s:running_windows
"    set backupdir=~/vimfiles/backup " where to put backup files
"    set directory=~/vimfiles/temp " directory to place swap files in
" else
set backupdir=~/.vim/backup " where to put backup files
set directory=~/.vim/temp " directory to place swap files in
"endif

set wildmenu " turn on command line completion wild style
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png " ignore these list file extensions
set wildmode=list:longest " turn on wild mode huge list
let html_number_lines = 0
let html_use_css = 0
let use_xhtml = 0

" Vim UI
    set modeline
    set incsearch " BUT do highlight as you type you search phrase
    set laststatus=2 " always show the status line
    set lazyredraw " do not redraw while running macros
    set linespace=0 " don't insert any extra pixel lines betweens rows
    set list " we do what to show tabs, to ensure we get them out of my files
    set listchars=tab:>-,trail:- " show tabs and trailing
    set matchtime=5 " how many tenths of a second to blink matching brackets for
    set nohlsearch " do not highlight searched for phrases
    set nostartofline " leave my cursor where it was
    set visualbell " blink
    set number " turn on line numbers
    set numberwidth=4 " We are good up to 9999 lines
    " set report=0 " tell us when anything is changed via :...
    set ruler " Always show current positions along the bottom
    set scrolloff=10 " Keep 10 lines (top/bottom) for scope
    set shortmess=aOstT " shortens messages to avoid 'press a key' prompt
    set showcmd " show the command being typed
    set showmatch " show matching brackets
    set sidescrolloff=10 " Keep 5 lines at the size
    set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
    "              | | | | |  |   |      |  |     |    |
    "              | | | | |  |   |      |  |     |    + current column
    "              | | | | |  |   |      |  |     +-- current line
    "              | | | | |  |   |      |  +-- current % into file
    "              | | | | |  |   |      +-- current syntax in square brackets
    "              | | | | |  |   +-- current fileformat
    "              | | | | |  +-- number of lines
    "              | | | | +-- preview flag in square brackets
    "              | | | +-- help flag in square brackets
    "              | | +-- readonly flag in square brackets
    "              | +-- rodified flag in square brackets
    "              +-- full path to file in the buffer
    set expandtab " no real tabs please!
    set formatoptions=rq " Automatically insert comment leader on return, and let gq format comments
    set ignorecase " case insensitive by default
    set infercase " case inferred by default
    set nowrap " do not wrap line

    set smartcase " if there are caps, go case-sensitive
    set shiftwidth=4 " auto-indent amount when using cindent, >>, << and stuff like that
    set softtabstop=4 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
    set tabstop=8 " real tabs should be 8, and they will show with set list on
    set smarttab

" Folding
    set foldenable " Turn on folding
    set foldmethod=indent " Fold on the indent (damn you python)
    set foldlevel=100 " Don't autofold anything (but I can still fold manually)
    set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
    function SimpleFoldText() " {
        return getline(v:foldstart).' '
    endfunction " }
    set foldtext=SimpleFoldText() " Custom fold text function (cleaner than default)



call plug#begin('~/.config/nvim/plugged')

Plug 'editorconfig/editorconfig-vim' " For filetype management.
Plug 'elzr/vim-json' " For metadata.json
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Install fuzzy finder. Use whatever you prefer for file browsing
Plug 'junegunn/fzf.vim' " Fuzzy Finder vim plugin
Plug 'mrk21/yaml-vim' " For hieradata
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}} " Language Server support
Plug 'rodjek/vim-puppet' " For Puppet syntax highlighting
Plug 'vim-ruby/vim-ruby' " For Facts, Ruby functions, and custom providers

call plug#end()


" This is because CDN ENG doesn't use spaces for tabs: 
" autocmd Filetype perl setlocal ts=4 sw=4 sts=0 noexpandtab
autocmd Filetype ruby setlocal ts=2 sw=2 sts=0 expandtab


" Term Settings
"if s:colorful_term
"    "256 color --
"    let &t_Co=256
"    " restore screen after quitting
"    if has("terminfo")
"        let &t_Sf="\ESC[3%p1%dm"
"        let &t_Sb="\ESC[4%p1%dm"
"    else
"        let &t_Sf="\ESC[3%dm"
"        let &t_Sb="\ESC[4%dm"
"    endif
"endif
