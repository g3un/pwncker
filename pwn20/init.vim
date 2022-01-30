set ai
set ar
set cin
set et
set hid
set hls
set ic
set nobk
set nowrap
set nu
set ru
set scs
set si
set sm
set sta
set sts=4
set sw=4
set title
set ts=4
set cc=120
filetype plugin on
syntax on

let g:mapleader = ","

nmap <Leader>C :enew<CR>
nmap <Leader>bq :bp <BAR> bd #<CR>
nmap <Leader>" :split<CR>
nmap <Leader>% :vsplit<CR>

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'ap/vim-buftabline'

Plug 'Yggdroot/indentLine'

Plug 'easymotion/vim-easymotion'
Plug 'junegunn/seoul256.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()

let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeIgnore = []
autocmd BufEnter * lcd %:p:h
map <Leader>t <ESC>:NERDTreeToggle<CR>

let g:buffergator_viewport_split_policy = "R"
let g:buffergator_suppress_keymaps = 1
nmap <leader>bl :BuffergatorOpen<cr>
nmap <leader>h :BuffergatorMruCyclePrev<cr>
nmap <leader>l :BuffergatorMruCycleNext<cr>

colo seoul256
