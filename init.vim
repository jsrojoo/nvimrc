call plug#begin('~/.config/nvim/plugged')
" Navigation
" Plug 'Shougo/denite.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuttie/comfortable-motion.vim'

" Completions
Plug 'AndrewRadev/tagalong.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'alvan/vim-closetag'
Plug 'moll/vim-node'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'pangloss/vim-javascript'

" Syntax | Indents
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'posva/vim-vue'
Plug 'nathanaelkane/vim-indent-guides'

" Utilities
Plug 'benmills/vimux'
Plug 'chrisbra/NrrwRgn'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
Plug 'metakirby5/codi.vim'
Plug 'osyo-manga/vim-over'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'unblevable/quick-scope'
Plug 'wellle/targets.vim'
Plug 'iamcco/markdown-preview.nvim',
      \ {
      \   'do': { -> mkdp#util#install() },
      \   'for': ['markdown', 'vim-plug']
      \ }
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}


" Aestetics
Plug 'norcalli/nvim-colorizer.lua'
Plug 'junegunn/limelight.vim'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colorschemes
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'flrnd/candid.vim'
Plug 'rakr/vim-one'
call plug#end()

map <space> <leader>

" unblevable/quick-scope color configuration
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary ctermfg=81 cterm=underline
augroup END

syntax on
" set background=dark " for the dark version
" set background=light " for the light version
colorscheme palenight
highlight Normal guibg=NONE ctermbg=NONE
hi Search guibg=gray guifg=wheat


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

lua require'colorizer'.setup()

source ~/.local/share/nvim/site/config/airline.vim
source ~/.local/share/nvim/site/config/signify.vim
source ~/.local/share/nvim/site/config/fzf.vim
source ~/.local/share/nvim/site/config/netrw.vim
source ~/.local/share/nvim/site/config/vimux.vim
source ~/.local/share/nvim/site/config/nrrw_rgn.vim
source ~/.local/share/nvim/site/config/neosnippet.vim
source ~/.local/share/nvim/site/config/coc.vim

" unblevable/quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" lsp for vue using vls for vetur
let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
" closetag config
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.vue, *.markdown'

" vimvue config
let g:vue_disable_pre_processors=1

" tag along config
let g:tagalong_filetypes = ['html', 'vue', 'md']

" browser to use when opening links / files like markdown
let g:mkdp_browser = 'firefox'
let g:mkdp_refresh_slow = 1
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 1,
    \ 'sync_scroll_type': 'top',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false
    \ }

" Wrap in try/catch to avoid errors on initial install before plugin is available
let g:python3_host_prog = '/home/rojo/.pyenv/versions/simone/bin/python'

let g:neosnippet#snippets_directory="/home/rojo/.local/share/nvim/site/custom-snippets"

" sneak hints
let g:sneak#label = 1
" sneak search to use ignorecase and smartcase
let g:sneak#use_ic_scs = 1

highlight Sneak guifg=black guibg=red ctermfg=black ctermbg=red
highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow
highlight SneakLabel guifg=red guibg=yellow ctermfg=black ctermbg=yellow

set expandtab
set shiftwidth=2
set softtabstop=2

set timeoutlen=1000 ttimeoutlen=0

set ignorecase " ignorecasing
set smartcase  " better case-sensitivity when searching

set number  " always show current line number
set relativenumber

set updatetime=500
set signcolumn=yes
set colorcolumn=80
set textwidth=80
" set scrolloff=999

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

" use vertical cursor on insert mode
set guicursor=i:ver1
" enable cursor blinking
set guicursor+=a:blinkon1

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

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
nmap <C-A-r> :SignifyHunkUndo<cr>

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
" nnoremap zM :set foldlevel=0<CR>

nmap <Leader>l :Limelight!!<cr>

" mapping to select single quotes
" nnoremap <leader>sq vi'"+y

" mapping to yank to system clipboard
vnoremap <leader>y "+y

nnoremap <leader>cm :CocCommand markmap.create<cr>

" indent guide toggle
nnoremap <leader>id :IndentGuidesToggle<cr>

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=2

" yuttie/comfortable-motion.vim
let g:comfortable_motion_interval = 100 / 60
let g:comfortable_motion_friction = 300.0
let g:comfortable_motion_air_drag = 0.0

function! VisualFindAndReplace()
    :OverCommandLine%s/
endfunction

function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
endfunction

nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>
