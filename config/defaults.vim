map <space> <leader>

" remove brackets (~) on empty lines
let &fcs='eob: '

set expandtab
set shiftwidth=2
set softtabstop=2

set timeoutlen=1000 ttimeoutlen=0

set ignorecase " ignorecasing
set smartcase  " better case-sensitivity when searching

set number  " always show current line number
set relativenumber

set updatetime=500
set signcolumn=no
set colorcolumn=75
set textwidth=75
set scrolloff=999

set list
set listchars=trail:~
set statusline^=%{coc#status()}
set title titlestring=%{expand(\"%:p\")}

set foldmethod=syntax
set hidden
set mouse:a

set nowrap
set nobackup  " no backup or swap file, live dangerously
set noswapfile  " swap files give annoying warning
set nowrapscan " stop incremental search at EOF
set noshowmode  " keep command line clean
" set noshowcmd  " keep command line clean
set hlsearch
set pumheight=3

" use vertical cursor on insert mode
set guicursor=i:ver1
" enable cursor blinking
set guicursor+=a:blinkon1

" use system clipboard by default
set clipboard=unnamedplus

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

nnoremap Q @q

" COLEMAK mappings
nnoremap n j
nnoremap e k
nnoremap L e
" nnoremap l e
" nnoremap L E
vnoremap n j
vnoremap e k
" vnoremap l e
vnoremap L E
nnoremap k n
nnoremap K N
vnoremap k n
vnoremap K N
" easy split movement
nnoremap <M-h> <C-w>h
nnoremap <M-n> <C-w>j
nnoremap <M-e> <C-w>k
nnoremap <M-i> <C-w>l
nnoremap <C-w>v <C-w>v<C-w><C-w>
nnoremap <C-w>s <C-w>s<C-w><C-w>
nnoremap <C-w>r <C-w>s<C-w><C-w>

nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q!<cr>

nnoremap <leader>fs :set foldmethod=syntax<CR>
nnoremap <leader>fi :set foldmethod=indent<CR>

