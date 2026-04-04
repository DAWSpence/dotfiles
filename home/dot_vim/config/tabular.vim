
if !exists(':Tabularize')
    finish "Tabular plugin not loaded"
else

  nmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  nmap <Leader>a; :Tabularize /;\zs<CR>
  vmap <Leader>a, :Tabularize /,<CR>
  vmap <Leader>a\ :Tabularize /\/<CR>

endif






