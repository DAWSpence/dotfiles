
set omnifunc=ale#completion#OmniFunc

nnoremap K <cmd>ALEHover<CR>
nnoremap <leader>gd <cmd>ALEGoToDefinition<CR>
nnoremap <leader>gr <cmd>ALEFindReferences<CR>
nnoremap <leader>ca <cmd>ALECodeAction<CR>

let g:ale_completion_enabled = 1

" let g:airline#extensions#ale#enabled = 1
