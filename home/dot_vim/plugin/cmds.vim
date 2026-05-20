
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
    autocmd BufWritePre * if &modifiable && &modified | call RCStripWSBL() | endif
augroup END



function! RCStripWSBL()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//ge
    %s/\(\n\)\+\%$//ge
    call cursor(l, c)
endfunction



"handy search functions"
"https://gosukiwi.github.io/vim/2022/04/19/vim-advanced-search-and-replace.html"

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










"keybindings for functions"

xnoremap ,rf :s///g<Left><Left>Lo
xnoremap ,rr :s///gc<Left><Left><Left>

nnoremap ,rf :%s///g<Left><Left>
nnoremap ,rr :%s///gc<Left><Left><Left>


nnoremap <Leader>rg :Grep<Space>
nnoremap <silent> <Leader>rp :call feedkeys(':Replace<Space><Tab>', 't')<CR>
nnoremap <silent> <Leader>rl :call LocalSearch() <CR>

"change binding"
nnoremap <silent> <Leader>as :call RCStripWSBL()<CR>

nnoremap <silent> <leader>TH :call DeleteTabLeft()<CR>
nnoremap <silent> <leader>TL :call DeleteTabRight()<CR>


nnoremap <silent> <leader>BH :call DeleteBufLeft()<CR>
nnoremap <silent> <leader>BL :call DeleteBufRight()<CR>


