" FZF settings 

" Recreate ctrl + p filesearch from vs code

" - Find the directory vim was called upon, for ctrl - p shortcut 
function FindSessionDirectory() abort
  if len(argv()) > 0
    return fnamemodify(argv()[0], ':p:h')
  endif
  return getcwd()
endfunction!


" TODO: Move keybind to keymapping file 
" Fuzzy find on current directory with ctrl+p 
let startdir = FindSessionDirectory()
execute "nnoremap <C-p> :FZF ".startdir."<CR>" 

" Don't show the match x out y message in echo area 
 if has("patch-7.4.314")
    set shortmess+=c
endif


