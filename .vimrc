syntax on
filetype plugin indent on
set ts=4 sts=4 sw=4 et ai si " Tab spaces
set rnu " relative numbers
set nu
set incsearch
set term=screen-256color " Fix tmux bug

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" " Fix colors
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" " Fix colors

call plug#begin()
" Themes
Plug 'gruvbox-community/gruvbox' " gruvbox theme
"Plug 'catppuccin/vim', { 'as': 'catppuccin' } " catppuccin theme
"Plug 'joshdick/onedark.vim' " onedark theme
"Plug 'nordtheme/vim' " nord theme

Plug 'vim-airline/vim-airline' " airline
Plug 'vim-airline/vim-airline-themes'

Plug 'christoomey/vim-tmux-navigator'
"coc_edit:Plug 'neoclide/coc.nvim' " Syntax hightlight and autosuggestions
call plug#end()

set background=dark
colorscheme gruvbox

"Autocomplition
"coc_edit:set encoding=utf-8
"coc_edit:set nobackup
"coc_edit:set nowritebackup
"coc_edit:set updatetime=300

" Airline
let g:airline_powerline_fonts = 1

" Netrw
let g:netrw_banner = 0 " disable top help menu
let g:netrw_liststyle = 3

"coc_edit:inoremap <expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<TAB>"

" let b:coc_suggest_disable = 1 " Disable autosuggestion
