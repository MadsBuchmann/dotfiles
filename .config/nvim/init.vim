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
" vim-svelte & dependencies - syntax highlighting for svelte
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
" Language server for python 
Plug 'pappasam/coc-jedi'
call plug#end()

" Basic settings 
set noswapfile " disable swap files
set encoding=utf-8  " Always display as utf-8
set fileencoding=utf-8  " Always write to utf-8 
set foldmethod=indent "TODO: Should use syntax instead?
set splitbelow " :split open below current window 
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab " Set tab to consist of 2 spaces
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Don't autocomment next line 
