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
nmap <silent> <leader>wh :split<CR>
nmap <silent> <leader>wv :vsplit<CR>
nmap <silent> <leader>wq :quit!<CR>
nmap <silent> <leader>wo <C-w>o<CR>
noremap ]w <C-w>r<CR> 
noremap [w <C-w>R<CR> 



" increase or decrease window height/width, we aren't using keyboards without arrows
nmap <silent> <C-Down> 2<C-w>-
nmap <silent> <C-Up> 2<C-w>+
nmap <silent> <C-Left> :vertical resize -5<CR>
nmap <silent> <C-Right> :vertical resize +5<CR>
nmap <silent> <Leader>= <C-w>=<CR> 


"buffers"

"create buffer"

function NameFile()
  let l:i = input("Enter filename ")
  execute "silent badd " . i
endfunction

nnoremap <silent> <leader>ba :call NameFile()<CR>

" close buffer
nnoremap <silent> <leader>bd :bd<CR>

"closs all buffers"
nnoremap <silent> <leader>bD :%bd<CR>

" kill buffer
nnoremap <silent> <leader>bk :bd!<CR>


command! BufCurOnly execute '%bdelete|edit#|bdelete#'

nnoremap <silent> <leader>be ::BufCurOnly<CR>



" toggle buffer (switch between current and last buffer)
nnoremap <silent> <leader>bq <C-^>


" " go to next buffer
" nnoremap <silent> <]b :bn<CR>
"
" " go to previous buffer
" nnoremap <silent> [b :bp<CR>
"

" list buffers
nnoremap <silent> <leader>bl :ls<CR>

" list and select buffer
nnoremap <silent> <leader>bs :ls<CR>:buffer<Space>

" horizontal split with new buffer
nnoremap <silent> <leader>bh :new<CR>

" vertical split with new buffer
nnoremap <silent> <leader>bv :vnew<CR>

"populate the quickfix buffers"
noremap <silent> <leader>bx :call setqflist(map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), '{"bufnr":v:val}'))

"create scratch buffers"
noremap <silent> <leader>bcv :vnew<CR> 
noremap <silent> <leader>bch :hnew<CR> 


"open tab to the right and left"
noremap <leader>tnl :tabnew +<CR>
noremap <leader>tnh :tabnew -<CR>

"allow window to be opened in new tab"
noremap <leader>tnw <C-w>T<CR>
noremap <leader>tnn :tabnew<CR>


"delete tab to the right and left"
noremap <leader>tdl :tabclose +<CR>
noremap <leader>tdh :tabclose -<CR>
noremap <leader>tdd :tabclose<CR>

"list tabs"
noremap <leader> tl :tabs<CR>


"move to next tabs"
noremap ,t[ :tabp<CR>
noremap ,t] :tabn<CR>


"swap tabs"
noremap ,T[ :tabm -<CR>
noremap ,T] :tabm +<CR>





nnoremap <Leader>gp gqap
xnoremap <Leader>ga gqa


"copy last viz selection"
vmap y ygv<Esc>


"clear highlights after search"
nnoremap <silent> <BS> ::let @/=''<CR>

"recover from ctrl-u"
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

"easy quit"
nnoremap <silent> <leader>q :q!<CR>
nnoremap <silent> <leader>Q :qa!<CR>

"open quick and location lists seperately"
nnoremap <silent> <leader>xq :copen<CR>
nnoremap <silent> <leader>xl :lopen<CR>
nnoremap <silent> <leader>xj :jumps<CR>
nnoremap <silent> <leader>xcj :clearjumps<CR>
nnoremap <silent> <leader>xcq :call setqflist([])<CR>
nnoremap <silent> <leader>xcl :call setloclist([])<CR>


