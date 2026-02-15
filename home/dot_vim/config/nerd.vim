let NERDTreeMinimalUI=1
let NERDTreeDirArrows=0
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore=['\.pyc$', '\~$']
let NERDTreeShowLineNumbers = 1
let NERDTreeWinSize = 25

let g:nerdtree_vis_confirm_open =0
let g:nerdtree_vis_confirm_delete =0
let g:nerdtree_vis_confirm_copy =0
let g:nerdtree_vis_confirm_move =0
let g:nerdtree_vis_confirm_append_arglist =0
let g:nerdtree_vis_confirm_set_arglist =0

let g:NERDTreeGitStatusUseNerdFonts = 0
let g:NERDTreeGitStatusShowIgnored = 0
let g:NERDTreeGitStatusUntrackedFilesMode = 'normal'
let g:NERDTreeGitStatusShowClean = 0



function! NERDTreeQuit()

  redir => buffersoutput
  silent buffers
  redir END
  "                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor


  if (!windowfound)
    quitall
  endif


endfunction


autocmd WinEnter * call NERDTreeQuit()

let g:NERDTreeMapChangeRoot =  "`"

noremap <silent> <C-e> :silent! NERDTreeToggle<cr>
nmap <S-e> :NERDTreeTabsToggle<CR>
nnoremap <Leader>cn :NERDTreeCWD<CR>

