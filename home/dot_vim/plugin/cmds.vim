
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



"handy search functions"

xnoremap ,ff :s///g<Left><Left>
xnoremap ,fr :s///gc<Left><Left><Left>

nnoremap ,Ff :%s///g<Left><Left>
nnoremap ,Fr :%s///gc<Left><Left><Left>


" nnoremap <Leader>rp :vimgrep //g **/* 

func! CustomSearch(mode)
 " 1: search entire project, 
 " 2: search and replace in entire project,
 " 3: search in file and pop loc list,
 " 4: search in folder pop qlist,
 " 5: find and replace in entire folder"

  if a:mode == 1 
    let l:i = input('Enter search term (find in entire project): ')
    exec "vimgrep /" . l:i . "/g **/* | cfopen" 


  elseif a:mode == 2
    let l:i = input('Enter search term (find and replace in entire project): ')
    let l:k = input('Enter replace term (find and replace in entire project): ')
    exec "vimgrep /" . l:i . "/g **/*"
    exec "cfdo %s" . l:i . l:k ."/g | update"


  elseif a:mode == 3
    let l:i = input("Enter search term in file ")
    let l:buffer = bufname()
    exec "lvimgrep /" . l:i . "/g" . l:buffer . " | lopen"


  elseif a:mode == 4
    let l:i = input('Enter search term (find in folder): ')
    let l:folder = input('Folder (find in folder): ')
    exec "vimgrep /" . l:i . "/g" . l:folder . " | cfopen" 


  endif

endfunction



nnoremap <Leader>rp :call CustomSearch(1)<CR>
nnoremap <Leader>rP :call CustomSearch(2)<CR>
nnoremap <Leader>rf :call CustomSearch(3)<CR>
nnoremap <Leader>rF :call CustomSearch(4)<CR>


"function that allows one to change into the config dir then back again"
" function! ConfigDir()
"
" endfunction
"


"change to config dir"
" nnoremap <Leader>vc :call ExecuteCmdline("edit $HOME/.vim") 


