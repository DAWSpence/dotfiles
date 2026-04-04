" let g:floaterm_keymap_new = '<c-\>'
let g:floaterm_keymap_next = ']t'
let g:floaterm_keymap_next = '[t'
let g:floaterm_titleposition = 'center'
let g:floaterm_keymap_toggle = '<c-\>'
let g:floaterm_height = 0.9
let g:floaterm_keymap_width = 0.9
let g:floaterm_title = 'Terminal'


"this will allow us to open in current dir"
func! s:get_dir(path) abort

  if isdirector(a:path)
    let dir = fnamemodify(a:path, ':p')

  elseif filereadable(a:path)
    let dir = fnamemodify(a:path, ':p:h')

  else
    let dir = fnamemodify(getcwd(), ':p')

  endif


  let dir = fnamemodify(dir, ':~')
  let dir = escape(dir, '%#|"')
  
  return dir

endfunc






