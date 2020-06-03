call plug#begin('~/.config/nvim/plugged')
" Navigation
" Plug 'Shougo/denite.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Completions
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/tagalong.vim'

" Syntax | Indents
Plug 'posva/vim-vue'
Plug 'Vimjas/vim-python-pep8-indent'

" Utilities
Plug 'justinmk/vim-sneak'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'chrisbra/NrrwRgn'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'iamcco/markdown-preview.nvim',
      \ {
      \   'do': { -> mkdp#util#install() },
      \   'for': ['markdown', 'vim-plug']
      \ }

" Aestetics
Plug 'chrisbra/Colorizer'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-signify'
Plug 'junegunn/limelight.vim'

" Colorschemes
Plug 'flrnd/candid.vim'
Plug 'rakr/vim-one'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'
call plug#end()

let mapleader = " "
map \ <leader>

syntax on
set background=dark " for the dark version
" set background=light " for the light version
" colorscheme Tomorrow-Night
" colorscheme one
" colorscheme gruvbox
colorscheme candid

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

source ~/.local/share/nvim/site/config/airline.vim
source ~/.local/share/nvim/site/config/signify.vim
source ~/.local/share/nvim/site/config/fzf.vim
source ~/.local/share/nvim/site/config/netrw.vim
source ~/.local/share/nvim/site/config/vimux.vim
source ~/.local/share/nvim/site/config/maps/neosnippet.vim
source ~/.local/share/nvim/site/config/maps/coc.vim

" lsp for vue using vls for vetur
let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
" closetag config
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.vue'

" vimvue config
let g:vue_disable_pre_processors=1

" tag along config
let g:tagalong_filetypes = ['html', 'vue']

" browser to use when opening links / files like markdown
let g:mkdp_browser = 'firefox'

" Wrap in try/catch to avoid errors on initial install before plugin is available
let g:python3_host_prog = '/home/rojo/.pyenv/versions/simone/bin/python'

let g:neosnippet#snippets_directory="/home/rojo/.local/share/nvim/site/custom-snippets"

" sneak hints
let g:sneak#label = 1
" sneak search to use ignorecase and smartcase
let g:sneak#use_ic_scs = 1

set expandtab
set shiftwidth=2
set softtabstop=2

set timeoutlen=1000 ttimeoutlen=0
set nobackup  " no backup or swap file, live dangerously
set noswapfile  " swap files give annoying warning
set nowrap
set nowrapscan " stop incremental search at EOF
set number  " always show current line number
set ignorecase " ignorecasing
set smartcase  " better case-sensitivity when searching
set noshowmode  " keep command line clean
set updatetime=500
set signcolumn=yes
set colorcolumn=90
set textwidth=80
set nohlsearch
set scrolloff=999
set title titlestring=%{expand(\"%:p\")}
set list
set listchars=trail:~
set statusline^=%{coc#status()}
set relativenumber
set foldmethod=indent
set foldlevel=1
set cursorline
set invlist

nnoremap Q @q
"" easy split movement
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <C-w>v <C-w>v<C-w><C-w>
nnoremap <C-w>s <C-w>s<C-w><C-w>

nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q!<cr>

nmap [c <plug>(signify-next-hunk):SignifyHunkDiff<cr>
nmap ]c <plug>(signify-prev-hunk):SignifyHunkDiff<cr>
nmap <C-A-z> :SignifyHunkUndo<cr>

function! s:ToggleBlame()
    if &l:filetype ==# 'fugitiveblame'
        close
    else
        Gblame
    endif
endfunction

nnoremap <leader>bb :call <SID>ToggleBlame()<CR>

nnoremap <leader>fs :set foldmethod=syntax<CR>
nnoremap <leader>fi :set foldmethod=indent<CR>
nnoremap zM :set foldlevel=1<CR>

nmap <Leader>l :Limelight!!<cr>

" mapping to select single quotes
" nnoremap <leader>sq vi'"+y

" mapping to yank to system clipboard
vnoremap <leader>y "+y
