"enable syntax and basic editing functionality"
filetype plugin indent on
syntax on


"cursor"
set guicursor&


"no need for vi"
set nocompatible

"shorten some commands messaging"
set shortmess=at



"basic tabs and shift len"
set shiftwidth=4
set tabstop=4
set smarttab


"allow for ruler and smart formatting"
set ruler
set expandtab

"list tabs and spaces"
set list 
set showbreak=↪\ 
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨



"set line num, backspaces and relativenumber"
set backspace=indent,eol,start

set number

set relativenumber

set nostartofline


"allow mouse and breakindents"
set mouse=a

set laststatus=2

set breakindent


"ignore cases and smartcase, also enable regex searches"
set ignorecase

set smartcase

set magic



" Enable clipboard if possible
if has('clipboard')
    if has('unnamedplus') " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif


"no storing session variables"
set sessionoptions-=options


"set the viminfo file"
set viminfo+=n~/.viminfo


"update file if changed externally"
set autoread


"set splits"
set splitright

set splitbelow


"set scroll off and signcolumn"
set scrolloff=100

set signcolumn=yes


"completeopts and tabstop"
set completeopt=menu,noselect,popup

"no included files for performance"
set complete-=i


set tabstop=4

"no annoying bells"
set noerrorbells visualbell t_vb=
set belloff=all


"incsearch and timeouts"
set incsearch

set ttimeout

set timeoutlen=1000

set ttimeoutlen=0


"hidden buff"
set hidden

"smartindents and history"
set smartindent

set history=1000


"brackets and session title"
set matchtime=2

set title


"no scroll bars"
set guioptions-=r

set guioptions-=R

set guioptions-=l

set guioptions-=L


"no need for swap"
set noswapfile

"performance boost when redrawing"
set lazyredraw

"hide mouse when typing"
set mousehide


"we are not writing novels here"
set nospell


"enable wildmode"
set wildmenu 
set wildmode=full,longest,list


"dont backup files"
set nobackup
set nowritebackup

"increase tty speed"
set ttyfast

"when to show tabs"
set showtabline=1

"speed up terminal"
set noshowcmd

"control num increments"
set nrformats=alpha,octal,hex

"defien vim hist"
set history=1024




"ignore compiled files"
set wildignore=*.so,*.swp,*.pyc,*.pyo,*.exe,*.7z

if has("win16") || has("win32") 
  set wildignore+=.git\*,.hg\*,.svn\*
  set renderoptions=type:directx
  set shellslash
  map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

end


"undofile"
try
    set undodir='./temp/undo'
    set undofile
catch

endtry





