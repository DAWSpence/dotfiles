
"no annoying comments after space"
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

"allows one to exit a buffer without needing to press esc"
autocmd BufEnter * execute "silent echo"

"auto win resize"
autocmd VimResized * wincmd =


"jump to prev location in file"
autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif


 " Strip trailing spaces and blank lines of EOF when saving files

if !exists('g:rc_strip_wsbl')
    let g:rc_strip_wsbl = 1
else
    if g:rc_strip_wsbl == 0 | augroup! rc_strip_wsbl | endif
endif



augroup rc_strip_wsbl
    autocmd!
    autocmd BufWritePre * |
          \ if &modifiable && &modified |
            \ call RCStripWSBL() |
          \ endif
augroup END



function! RCStripWSBL() 
    let l = line(".")
    let c = col(".")
    %s/\s\+$//ge
    %s/\(\n\)\+\%$//ge
    call cursor(l, c)
endfunction


xnoremap ,rf :s///g<Left><Left>Lo
xnoremap ,rr :s///gc<Left><Left><Left>

nnoremap ,rf :%s///g<Left><Left>
nnoremap ,rr :%s///gc<Left><Left><Left>


function! s:setup_terminal()

  if &buftype == 'terminal' 

    tnoremap <ESC> <C-w>N
    tnoremap <C-h> <c-\><C-n><C-w>h
    tnoremap <C-j> <c-\><C-n><C-w>j
    tnoremap <C-k> <c-\><C-n><C-w>k
    tnoremap <C-l> <c-\><C-n><C-w>l
    tnoremap <C-w> <c-\><C-n><C-w>w
    inoremap <C-h> <ESC><C-w>h
    inoremap <C-j> <ESC><C-w>j
    inoremap <C-k> <ESC><C-w>k
    inoremap <C-l> <ESC><C-w>l
    inoremap <C-w> <ESC><C-w>w

  endif

endfunction

"terminal sizes"
augroup terminal_funcs 
  autocmd!
  autocmd TerminalWinOpen * call s:setup_terminal()
augroup END



function! s:NetrwMappings()

  nnoremap <buffer> <C-h> <C-w>h
  nnoremap <buffer> <C-j> <C-w>j
  nnoremap <buffer> <C-k> <C-w>k
  nnoremap <buffer> <C-l> <C-w>l
  nnoremap <buffer> <leader>q :Lexplore<CR>

endfunction


augroup NetrwMappings
  autocmd!
  autocmd FileType netrw call s:NetrwMappings()
augroup END



"===================================================================="
"adding some of tpopes code here instead of needing vim bracketed, has features I dont need"


"move line count spaces up or down"

function! s:ExecMove(cmd) abort
  let old_fdm = &foldmethod
  if old_fdm !=# 'manual'
    let &foldmethod = 'manual'
  endif
  normal! m`
  silent! exe a:cmd
  norm! ``
  if old_fdm !=# 'manual'
    let &foldmethod = old_fdm
  endif
endfunction




function! s:Move(cmd, count, map) abort
  call s:ExecMove('move'.a:cmd.a:count)
  silent! call repeat#set("\<Plug>(unimpaired-move-".a:map.")", a:count)
endfunction

function! s:MoveSelectionUp(count) abort
  call s:ExecMove("'<,'>move'<--".a:count)
  silent! call repeat#set("\<Plug>(unimpaired-move-selection-up)", a:count)
endfunction

function! s:MoveSelectionDown(count) abort
  call s:ExecMove("'<,'>move'>+".a:count)
  silent! call repeat#set("\<Plug>(unimpaired-move-selection-down)", a:count)
endfunction

nnoremap <silent> <Plug>(unimpaired-move-up)            :<C-U>call <SID>Move('--',v:count1,'up')<CR>
nnoremap <silent> <Plug>(unimpaired-move-down)          :<C-U>call <SID>Move('+',v:count1,'down')<CR>
noremap  <silent> <Plug>(unimpaired-move-selection-up)   :<C-U>call <SID>MoveSelectionUp(v:count1)<CR>
noremap  <silent> <Plug>(unimpaired-move-selection-down) :<C-U>call <SID>MoveSelectionDown(v:count1)<CR>
nnoremap <silent> <Plug>unimpairedMoveUp            :<C-U>call <SID>Move('--',v:count1,'up')<CR>
nnoremap <silent> <Plug>unimpairedMoveDown          :<C-U>call <SID>Move('+',v:count1,'down')<CR>
noremap  <silent> <Plug>unimpairedMoveSelectionUp   :<C-U>call <SID>MoveSelectionUp(v:count1)<CR>
noremap  <silent> <Plug>unimpairedMoveSelectionDown :<C-U>call <SID>MoveSelectionDown(v:count1)<CR>


nmap <silent> [e <Plug>(unimpaired-move-up)
nmap <silent> ]e <Plug>(unimpaired-move-down)
nmap <silent> [e <Plug>(unimpaired-move-selection-up)
nmap <silent> ]e <Plug>(unimpaired-move-selection-down)





"space above or below"

function! s:BlankUp() abort
  let cmd = 'put!=repeat(nr2char(10), v:count1)|silent '']+'
  if &modifiable
    let cmd .= '|silent! call repeat#set("\<Plug>(unimpaired-blank-up)", v:count1)'
  endif
  return cmd
endfunction

function! s:BlankDown() abort
  let cmd = 'put =repeat(nr2char(10), v:count1)|silent ''[-'
  if &modifiable
    let cmd .= '|silent! call repeat#set("\<Plug>(unimpaired-blank-down)", v:count1)'
  endif
  return cmd
endfunction


nnoremap <silent> <Plug>(unimpaired-blank-up)   :<C-U>exe <SID>BlankUp()<CR>
nnoremap <silent> <Plug>(unimpaired-blank-down) :<C-U>exe <SID>BlankDown()<CR>

nnoremap <silent> <Plug>unimpairedBlankUp   :<C-U>exe <SID>BlankUp()<CR>
nnoremap <silent> <Plug>unimpairedBlankDown :<C-U>exe <SID>BlankDown()<CR>


nmap <silent> [<Space> <Plug>(unimpaired-blank-up)
nmap <silent> ]<Space> <Plug>(unimpaired-blank-down)





"pasting code portion"

function! s:putline(how, map) abort
  let reg = v:register
  let [body, type] = [getreg(reg), getregtype(reg)]
  if reg =~ '[:%.]' " detect read-only registers
    let [body_save, type_save] = [getreg('"'), getregtype('"')]
    let reg = '"'
    call setreg('"', body, type)
  endif
  if type ==# 'V'
    exe 'normal! "'.reg.a:how
  else
    call setreg(reg, body, 'l')
    exe 'normal! "'.reg.a:how
    call setreg(reg, body, type)
  endif
  if exists('l:body_save')
    call setreg('"', body_save, type_save)
  endif
  silent! call repeat#set("\<Plug>(unimpaired-put-".a:map.")")
endfunction

nnoremap <silent> <Plug>(unimpaired-put-above) :call <SID>putline('[p', 'above')<CR>
nnoremap <silent> <Plug>(unimpaired-put-below) :call <SID>putline(']p', 'below')<CR>
nnoremap <silent> <Plug>(unimpaired-put-above-rightward) :<C-U>call <SID>putline(v:count1 . '[p', 'Above')<CR>>']
nnoremap <silent> <Plug>(unimpaired-put-below-rightward) :<C-U>call <SID>putline(v:count1 . ']p', 'Below')<CR>>']
nnoremap <silent> <Plug>(unimpaired-put-above-leftward)  :<C-U>call <SID>putline(v:count1 . '[p', 'Above')<CR><']
nnoremap <silent> <Plug>(unimpaired-put-below-leftward)  :<C-U>call <SID>putline(v:count1 . ']p', 'Below')<CR><']
nnoremap <silent> <Plug>(unimpaired-put-above-reformat)  :<C-U>call <SID>putline(v:count1 . '[p', 'Above')<CR>=']
nnoremap <silent> <Plug>(unimpaired-put-below-reformat)  :<C-U>call <SID>putline(v:count1 . ']p', 'Below')<CR>=']
nnoremap <silent> <Plug>unimpairedPutAbove :call <SID>putline('[p', 'above')<CR>
nnoremap <silent> <Plug>unimpairedPutBelow :call <SID>putline(']p', 'below')<CR>




nmap <silent> [p, <Plug>(unimpaired-put-above)
nmap <silent> ]p, <Plug>(unimpaired-put-below)
nmap <silent> [P, <Plug>(unimpaired-put-above)
nmap <silent> ]P, <Plug>(unimpaired-put-below)

nmap <silent> >P, <Plug>(unimpaired-put-above-rightward)
nmap <silent> >p, <Plug>(unimpaired-put-below-rightward)
nmap <silent> <P, <Plug>(unimpaired-put-above-leftward)
nmap <silent> <p, <Plug>(unimpaired-put-below-leftward)
nmap <silent> =P, <Plug>(unimpaired-put-above-reformat)
nmap <silent> =p, <Plug>(unimpaired-put-below-reformat)


"end of tpope copy and paste"





"handy search functions"
"https://gosukiwi.github.io/vim/2022/04/19/vim-advanced-search-and-replace.html"
"mostly for quickfix replacements"

if !exists('s:latest_greps')
  let s:latest_greps = {}
endif



function! s:Grep(...) abort

  let pattern = get(a:, 1, '')

  if pattern == '' | return | endif

  let s:latest_greps[pattern] = 1

  let path = get(a:, 2, '**/*')

  execute 'silent! grep! "' . escape(pattern, '"-') . '" ' . path . ' | redraw! | copen'

endfunction



function! s:Replace(original, replacement) abort
  if a:original == '' || a:replacement == '' | return | endif

  execute 'cfdo %s/' . escape(a:original, '/') . '/' . a:replacement . '/ge'
endfunction


function! LatestGreps(ArgLead, CmdLine, CursorPos)
  return keys(s:latest_greps)
endfunction


command! -nargs=+ -complete=file Grep silent! call s:Grep(<f-args>)
command! -nargs=+ -complete=customlist,LatestGreps Replace silent! call s:Replace(<f-args>)


function LocalSearch()
    let l:i = input("Enter search term in file: ")
    let l:buffer = bufname()
    exec "lvimgrep /" . l:i . "/g" . l:buffer . " | lopen"
endfunction

nnoremap <Leader>rg :Grep<Space>
nnoremap <silent> <Leader>rp :call feedkeys(':Replace<Space><Tab>', 't')<CR>
nnoremap <silent> <Leader>rl :call LocalSearch() <CR>

" end of quickfix replacements"







"delete buffers to the left"
function DeleteBufLeft() 

  let l:currentbuf = bufnr('%')
  let l:bufs = filter(range(1,bufnr('%')), 'buflisted(v:val)')
  let l:indx = index(bufs,currentbuf)

  if indx <= 0
    return
  endif


  for bf in bufs[0:indx-1]
    execute 'silent! bdelete' bf
  endfor

endfunction




"delete buffers to the right"
function DeleteBufRight() 

  let l:currentbuf = bufnr('%')
  let l:bufs = filter(range(1,bufnr('$')), 'buflisted(v:val)')
  let l:indx = index(bufs,currentbuf)

  if indx == -1 || indx == len(bufs)-1
    return "No buffs"
  endif


  for bf in bufs[indx+1:]
    execute 'silent! bdelete' bf
  endfor

endfunction




"delete tabs to the left"
function DeleteTabLeft()
    let currtab = tabpagenr()

    if currtab == 1
      return
    endif

    for tab in reverse(range(1,currtab -1))
      execute 'silent! tabclose' . tab
    endfor

endfunction



"delete tabs to the left"
function DeleteTabRight()
    let currtab = tabpagenr()
    let lastab = tabpagenr('$')

    if currtab == lastab
      return
    endif

    for tab in reverse(range(currtab-1, lastab))
      execute 'silent! tabclose' . tab
    endfor

endfunction


nnoremap <silent> <leader>TDH :call DeleteTabLeft()<CR>
nnoremap <silent> <leader>TDL :call DeleteTabRight()<CR>
nnoremap <silent> <leader>TDD :call DeleteTabLeft() \| call DeleteTabRight()<CR>


nnoremap <silent> <leader>BDH :call DeleteBufLeft()<CR>
nnoremap <silent> <leader>BDL :call DeleteBufRight()<CR>
nnoremap <silent> <leader>BDD :call DeleteBufLeft() \| call DeleteBufRight()<CR>



"open config file"

function! VimConfig()

  let session_file = g:sessiondir . '/prev_session.vim'

  if getcwd(-1,0) ==# g:vimruntime

    execute 'source' session_file

  else
      
    execute 'w | mksession!' session_file
    execute 'edit' g:vimruntime . "/vimrc"
    execute 'cd' g:vimruntime 

  endif
  

endfunction


nnoremap <silent> <leader>vs :call VimConfig()<CR>

