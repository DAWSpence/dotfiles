
"no annoying comments after space"
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro


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




nnoremap <silent> <Leader>s :call RCStripWSBL()<CR>

function! RCStripWSBL()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//ge
    %s/\(\n\)\+\%$//ge
    call cursor(l, c)
endfunction
