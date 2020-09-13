call plug#begin('~/.config/nvim/plugged')
" Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuttie/comfortable-motion.vim'

" Completions
Plug 'AndrewRadev/tagalong.vim'
Plug 'honza/vim-snippets'
Plug 'alvan/vim-closetag'
Plug 'moll/vim-node'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'pangloss/vim-javascript'

" Syntax | Indents
Plug 'dominikduda/vim_current_word'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'posva/vim-vue'
Plug 'nathanaelkane/vim-indent-guides'

" Utilities
Plug 'benmills/vimux'
Plug 'chrisbra/NrrwRgn'
Plug 'christoomey/vim-tmux-navigator'
Plug 't9md/vim-smalls'
Plug 'metakirby5/codi.vim'
Plug 'osyo-manga/vim-over'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" Plug 'unblevable/quick-scope'
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
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim-colorizer.lua'

" Colorschemes
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'flrnd/candid.vim'
Plug 'rakr/vim-one'
call plug#end()

