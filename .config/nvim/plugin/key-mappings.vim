" Key mappings 

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Toggle line comment 
nmap ++ <plug>NERDCommenterToggle
" Disable arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
" Remap escape key to jj
inoremap jj <Esc>
inoremap <Esc> <NOP>
" Toggle NerdTree 
nmap <C-n> :NERDTreeToggle<CR> 
" Trigger COC completion
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Rename variable file wide 
nmap <leader>rn <Plug>(coc-rename)
" Shortcuts for tabnew and split 
nmap <leader>tn :tabnew<CR>
nmap <leader>vs :vsplit<CR>
nmap <leader>vst :vsplit \|:term<CR>
nmap <leader>tnt :tabnew \|:term<CR>

