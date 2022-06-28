" --- vim-plug plugin list
call plug#begin()
" Nerdtree - for file exploration
Plug('preservim/nerdtree')
" FZF - Fuzzy file finder 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Gruvbox - the colorscheme used 
Plug 'morhetz/gruvbox'
" OneHalf - light theme for outdoorsy programming 
Plug 'sonph/onehalf', {'rtp': 'vim/'}
" Comfortable-motion.vim - provides smooth scrolling
"Plug 'yuttie/comfortable-motion.vim'
" COC.vim - autocompletion for language server supported languages 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Typescript syntax highlighting 
Plug 'HerringtonDarkholme/yats.vim'
" Highlight git in nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
" devicons for nerdtree 
Plug 'ryanoasis/vim-devicons'
" Syntax highlighting in nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Block outcomment 
Plug 'scrooloose/nerdcommenter'
" ACK - for project search 
Plug 'mileszs/ack.vim'
" Indent Line - for showing indentation guides
Plug 'Yggdroot/indentLine'
" Surround.vim - used for changing surrounding signs
Plug 'tpope/vim-surround'
call plug#end()

" --- CoC extensions 

let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-prettier',
      \ 'coc-json',
      \ 'coc-pairs']


" --- NVIM settings

" -- Search Settings 
set ignorecase "Make search case insensitive by default. A search can be made case sensitive by appending \C to it
set smartcase " Automatically switch to a case-sensitive search if you use any capital letters

" -- Terminal settings 
" - Make it possible to exit terminal opened with :term using esc
" tnoremap <Esc> <C-\><C-n> 

" -- Folding 
set foldmethod=indent

" -- NERDCommenter 
" rebind 
nmap ++ <plug>NERDCommenterToggle
" - always write to utf-8 files 
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

set splitbelow " When splitting do it below the current window

set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab " Set tab to consist of 2 spaces

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Don't autocomment next line 

" -- Theming and appereance settings 

" - Onehalf settings, Light theme for outside use
" colorscheme onehalflight " Set colorscheme to onehalflight
" set t_Co=256

" - Gruvbox Settings, Dark theme for inside use
colorscheme gruvbox " Set colorscheme to gruvbox
set background=dark " Set Gruvbox to darkmode

" - General Appereance

set cursorline " Activate cursorline

set number " Activate line numbers by default
"set number rnu " Set relative line numbers by default <---- Fuck this. It makse the jumplist hard to use. 

set noshowmode " Don't show which mode we're in

set cmdheight=2 " Increase the size of the echo/cmd field

" -- Keymappings 

" - Disable arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" - Remap escape key to jj
inoremap jj <Esc>
inoremap <Esc> <NOP>


" --- Nerdtree settings 
nmap <C-n> :NERDTreeToggle<CR>

" --- FZF settings 

" -- Recreate ctrl + p filesearch from vs code

" - Find the directory vim was called upon, for ctrl - p shortcut 
function FindSessionDirectory() abort
  if len(argv()) > 0
    return fnamemodify(argv()[0], ':p:h')
  endif
  return getcwd()
endfunction!

" - Fuzzy find on current directory with ctrl p 
let startdir = FindSessionDirectory()
execute "nnoremap <C-p> :FZF ".startdir."<CR>" 

" -- Don't show the match x out y message in echo area 
 if has("patch-7.4.314")
    set shortmess+=c
endif

" -- NERDTree Settings 
let NERDTreeShowHidden = 1
"set macligatures
set guifont=Fira\ Code:h12

" --- CoC - Prettier 
 command! -nargs=0 Prettier :CocCommand prettier.formatFile " creates :Prettier command

 " --- CoC - Css 
 autocmd FileType scss setl iskeyword+=@-@

 " --- CoC - keyBinds
 " Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


" -- Settings for indentation line guides 
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" --- User Commands 

" -- Open file with default application 
command! Finder !open % -a finder

" -- NerdTree Shortcut 
command -nargs=* -complete=file NF :NERDTreeFind

" -- Open same file with different line ending 
command -nargs=1 -complete=file -bar Vex :vsplit %:r.<args>
command -nargs=1 -complete=file -bar Oex :e %:r.<args>

command -nargs=* -complete=file -bar Oh :Oex html
command -nargs=* -complete=file -bar Vh :Vex html

command -nargs=* -complete=file -bar Oc :Oex scss
command -nargs=* -complete=file -bar Vc :Vex scss

command -nargs=* -complete=file -bar Ot :Oex ts
command -nargs=* -complete=file -bar Vt :Vex ts

command -nargs=* -complete=file -bar Ocomp :Oh|:Vc|:Vt

" -- Shortcut for Vertical Resize 
command -nargs=1 -complete=file VR :vertical resize <args>

