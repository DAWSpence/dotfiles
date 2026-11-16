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


nmap <silent> <C-Down> :call Hsize(-1)<CR>
nmap <silent> <C-Up> :call Hsize(1)<CR>

nmap <silent> <C-Left> :call Vsize(-1)<CR>
nmap <silent> <C-Right> :call Vsize(1)<CR>
nmap <silent> <Leader>= <C-w>=<CR>


"buffers"

"create buffer"
function NameFile()
  try
    let l:i = input("Enter filename: ")
    execute "silent badd " . i
  catch 
  finally
    execute "silent badd [No Name]"
  endtry
endfunction


nnoremap <silent> <leader>bn :call NameFile()<CR>

" close buffer"
nnoremap <silent> <leader>bq :bd<CR>

"closs all buffers"
nnoremap <silent> <leader>bD :%bd!<CR>

" kill buffer"
nnoremap <silent> <leader>bd :bd!<CR>


command! BufCurOnly execute '%bdelete|edit#|bdelete#'

nnoremap <silent> <leader>be ::BufCurOnly<CR>



" toggle buffer (switch between current and last buffer)
nnoremap <silent> <leader>bt <C-^>

" list buffers
nnoremap <silent> <leader>bl :ls<CR>

" list and select buffer
nnoremap <silent> <leader>bs :buffers<CR>:buffer<Space>


" horizontal split with new buffer
nnoremap <silent> <leader>bh :new<CR>

" vertical split with new buffer
nnoremap <silent> <leader>bv :vnew<CR>

"populate the quickfix buffers"
noremap <silent> <leader>bx :call setqflist(map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), '{"bufnr":v:val}'))

"create scratch buffers"
noremap <silent> <leader>bcv :vnew<CR>
noremap <silent> <leader>bch :new<CR>

"create a named tab"
function NameTab(option)

  let l:i = input("Enter tabname: ")

  if a:option == 1

    execute "silent tabnew + " . i

  elseif a:option == 2

    execute "silent tabnew - " . i
  
  else 

    execute "silent tabnew " . i

  endif

endfunction



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
noremap <leader>tl :tabs<CR>


"open term buffer"
noremap <leader>trv :vertical terminal ++norestore<CR>
noremap <leader>trh :terminal ++norestore<CR>


"text formatting"
nnoremap <Leader>gp gqap
xnoremap <Leader>ga gqa


"copy last viz selection"
vmap y ygv<Esc>


"clear highlights after search"
nnoremap <silent> <BS> ::let @/=''<CR>

"recover from ctrl-u"
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>


"tpope keybindings without bracketed"
noremap <silent> [a :previous<CR>
noremap <silent> ]a :next<CR>

noremap <silent> [A :first<CR>
noremap <silent> ]A :last<CR>

noremap <silent> [b :bprevious<CR>
noremap <silent> ]b :bnext<CR>

noremap <silent> [B :bfirst<CR>
noremap <silent> ]B :blast<CR>

noremap <silent> [l :lprevious<CR>
noremap <silent> ]l :lnext<CR>

noremap <silent> [L :lfirst<CR>
noremap <silent> ]L :llast<CR>

noremap <silent> [<C-L> :lpfile<CR>
noremap <silent> ]<C-L> :lnfile<CR>

noremap <silent> [q :cprevious<CR>
noremap <silent> ]q :cnext<CR>

noremap <silent> [Q :cfirst<CR>
noremap <silent> ]Q :clast<CR>

noremap <silent> [<C-Q> :cpfile<CR>
noremap <silent> ]<C-Q> :cnfile<CR>

noremap <silent> [t :tabp<CR>
noremap <silent> ]t :tabn<CR>
noremap <silent> [T :tabfir<CR>
noremap <silent> ]T :tabl<CR>

noremap <silent> <S-h> :-tabm<CR>
noremap <silent> <S-m> :+tabm<CR>



noremap <silent> [<C-T> :ptprevious<CR>
noremap <silent> ]<C-T> :ptnext<CR>

noremap ]] <cmd>call search('[([{<]')<CR>
noremap [[ <cmd>call search('[([{<]', 'b')<CR>



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

"netrw"

nnoremap <silent> <leader>e :Lexplore<CR>
