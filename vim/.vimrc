"=Basic file editing config="

"=VimPlug="
"https://github.com/junegunn/vim-plug"

"Install vimplug and dirs if not available"
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Setting termguicolors"
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


"Plugin install"
call plug#begin('~/.vim/plugged')

  Plug 'morhetz/gruvbox'
  Plug 'tpope/vim-commentary'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'tpope/vim-surround'
  Plug 'bkad/CamelCaseMotion'
  Plug 'machakann/vim-highlightedyank'

call plug#end()


" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


"=Plugin settings="

"Color scheme"
let g:colors_name = "gruvbox"
set background=dark


"CamelCaseMotion"
let g:camelcasemotion_key = '<leader>'


"Vim highlight yank"
let g:highlightedyank_highlight_duration = 200


"=Basic Settings="

let &t_SI = "\e[5 q"

let &t_EI = "\e[1 q"

syntax on

let mapleader=' '

let maplocalleader=' '

set nocompatible

set backspace=indent,eol,start

set number

set relativenumber

set nostartofline

set mouse=a

set laststatus=2

set breakindent

set ignorecase

set smartcase

set ruler

set expandtab

set smarttab

set shiftwidth=2

set clipboard=unnamedplus,unnamed

set splitright

set splitbelow

set scrolloff=100

set tabstop=4

set noerrorbells visualbell t_vb=

set incsearch

set ttimeout

set timeoutlen=1000

set ttimeoutlen=0

set hidden


"==Basic Mappings=="


noremap j gj
noremap k gk

noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>

nnoremap <S-Tab> <C-w>w

map <Leader><Space> :let @/=''<CR>

nnoremap <Leader>g gqap
xnoremap <Leader>g gqa


nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>


xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

vmap y ygv<Esc>

"==Basic Autocmds=="

autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

autocmd VimResized * wincmd =





