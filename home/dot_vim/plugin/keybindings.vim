" better nav
noremap <silent> j gj
noremap <silent> k gk

" make navigating text easier with arrows
noremap  <silent> <Down> gj
noremap  <silent> <Up> gk
inoremap <silent> <Down> <C-o>gj
inoremap <silent> <Up> <C-o>gk

" naviagte windows easier
nnoremap <silent> <C-l> <C-w><C-l>
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-j> <C-w><C-j>

"split windows"
nnoremap <silent> <leader>wh :split<CR>
nnoremap <silent> <leader>wv :vsplit<CR>
nnoremap <silent> <leader>wq :quit!<CR>

" increase or decrease window height/width, we aren't using keyboards without arrows
map <silent> <C-Down> 2<C-w>-
map <silent> <C-Up> 2<C-w>+
map <silent> <C-Left> :vertical resize -5<CR>
map <silent> <C-Right> :vertical resize +5<CR>


map <Leader><Space> :let @/=''<CR>

nnoremap <Leader>gp gqap
xnoremap <Leader>ga gqa


nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>


xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn


"copy last viz selection"
vmap y ygv<Esc>


"clear highlights after search"
nnoremap <silent> <BS> :nohlsearch<CR>

"recover from ctrl-u"
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>



"buffers"

" close buffer
nnoremap <silent> <leader>bd :bd<CR>

" kill buffer
nnoremap <silent> <leader>bk :bd!<CR>

" toggle buffer (switch between current and last buffer)
nnoremap <silent> <leader>bb <C-^>

" go to next buffer
nnoremap <silent> <leader>bn :bn<CR>

" go to previous buffer
nnoremap <silent> <leader>bp :bp<CR>

" list buffers
nnoremap <silent> <leader>bl :ls<CR>

" list and select buffer
nnoremap <silent> <leader>bs :ls<CR>:buffer<Space>

" horizontal split with new buffer
nnoremap <silent> <leader>bh :new<CR>

" vertical split with new buffer
nnoremap <silent> <leader>bv :vnew<CR>

"easy quit"
nnoremap <silent> <leader>q :q!<CR>





