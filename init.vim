call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/denite.nvim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'lepture/vim-jinja'
Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'chrisbra/NrrwRgn'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-signify'
Plug 'junegunn/limelight.vim'
Plug 'rakr/vim-one'
call plug#end()

syntax on
let g:airline_theme='one'
colorscheme one
set background=dark " for the dark version
" set background=light " for the light version
set termguicolors

set expandtab
set shiftwidth=2
set softtabstop=2

set timeoutlen=1000 ttimeoutlen=0
set nobackup  " no backup or swap file, live dangerously
set noswapfile  " swap files give annoying warning
set nowrapscan " stop incremental search at EOF
set number  " always show current line number
set ignorecase " ignorecasing
set smartcase  " better case-sensitivity when searching
set noshowmode  " keep command line clean
set showcmd
set updatetime=1000
set signcolumn=yes
set colorcolumn=80
set textwidth=80
set nohlsearch
set scrolloff=999
set title titlestring=%{expand(\"%:p\")}
set list
set listchars=trail:~
set autochdir

let g:signify_sign_add               = 'A'
let g:signify_sign_delete            = 'D'
let g:signify_sign_delete_first_line = 'DF'
let g:signify_sign_change            = 'M'
let g:signify_sign_changedelete      = 'MD'

let g:neosnippet#snippets_directory="/home/rojo/.local/share/nvim/site/custom-snippets"

let g:netrw_banner = 0
let g:netrw_winsize = 20

nnoremap Q @q
"" easy split movement
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <C-n>v <C-w>v<C-w><C-w>
nnoremap <C-n>h <C-w>s<C-w><C-w>


nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>

" Wrap in try/catch to avoid errors on initial install before plugin is available
let g:python3_host_prog = '/bin/python3.7'

try
  " === Denite setup ==="
  " Use ripgrep for searching current directory for files
  " By default, ripgrep will respect rules in .gitignore
  "   --files: Print each file that would be searched (but don't search)
  "   --glob:  Include or exclues files for searching that match the given glob
  "            (aka ignore .git files)
  "
  call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

  " Use ripgrep in place of "grep"
  call denite#custom#var('grep', 'command', ['rg'])

  " Custom options for ripgrep
  "   --vimgrep:  Show results with every match on it's own line
  "   --hidden:   Search hidden directories and files
  "   --heading:  Show the file name above clusters of matches from each file
  "   --S:        Search case insensitively if the pattern is all lowercase
  call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

  " Recommended defaults for ripgrep via Denite docs
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])

  " Remove date from buffer list
  call denite#custom#var('buffer', 'date_format', '')

  " Open file commands
  call denite#custom#map('insert,normal', "<C-t>", '<denite:do_action:tabopen>')
  call denite#custom#map('insert,normal', "<C-v>", '<denite:do_action:vsplit>')
  call denite#custom#map('insert,normal', "<C-h>", '<denite:do_action:split>')

  " Custom options for Denite
  "   auto_resize             - Auto resize the Denite window height automatically.
  "   prompt                  - Customize denite prompt
  "   direction               - Specify Denite window direction as directly below current pane
  "   winminheight            - Specify min height for Denite window
  "   highlight_mode_insert   - Specify h1-CursorLine in insert mode
  "   prompt_highlight        - Specify color of prompt
  "   highlight_matched_char  - Matched characters highlight
  "   highlight_matched_range - matched range highlight
  let s:denite_options = {'default' : {
        \ 'split': 'horizontal',
        \ 'start_filter': 1,
        \ 'auto_resize': 1,
        \ 'source_names': 'short',
        \ 'prompt': 'λ:',
        \ 'statusline': 0,
        \ 'highlight_matched_char': 'WildMenu',
        \ 'highlight_matched_range': 'Visual',
        \ 'highlight_window_background': 'Visual',
        \ 'highlight_filter_background': 'StatusLine',
        \ 'highlight_prompt': 'StatusLine',
        \ 'winrow': 1,
        \ 'vertical_preview': 1
        \ }}

  " Loop through denite options and enable them
  function! s:profile(opts) abort
    for l:fname in keys(a:opts)
      for l:dopt in keys(a:opts[l:fname])
        call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
      endfor
    endfor
  endfunction

  call s:profile(s:denite_options)
catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry

" === Denite shorcuts === "
"   <leader>e  - Browser currently open buffers
"   <leader>t  - Browse list of files in current directory
"   <leader>g  - Search current directory for occurences of given term and close window if no results
"   <leader>cw - Search current directory for occurences of word under cursor
nmap <leader>e :Denite buffer<CR>
nmap <C-e> :Denite buffer<CR>
nmap <leader>t :DeniteProjectDir file/rec<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>cw :<C-u>DeniteCursorWord grep:.<CR>

" Define mappings while in 'filter' mode
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o>
        \ <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <Esc>
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
        \ denite#do_map('quit')
  inoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
endfunction

" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
        \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-o>
        \ denite#do_map('open_filter_buffer')
endfunction

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
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
endif

autocmd CursorHold * silent call CocActionAsync('highlight')

" gd - go to definition of word under cursor
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)

" gi - go to implementation
nmap <silent> gi <Plug>(coc-implementation)

" gr - find references
nmap <silent> gr <Plug>(coc-references)

" gh - get hint on whatever's under the cursor
" nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>

" " list commands available in tsserver (and others)
" nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>

" " restart when tsserver gets wonky
" nnoremap <silent> <leader>cR  :<C-u>CocRestart<CR>

" " view all errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<CR>

" " rename the current word in the cursor
nmap <leader>cr  <Plug>(coc-rename)
nmap <leader>cf  <Plug>(coc-format-selected)
vmap <leader>cf  <Plug>(coc-format-selected)

" run code actions
vmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

nmap <leader>fe :CocCommand eslint.executeAutofix<cr>

nmap <C-_>   gcc
vmap <C-_>   gcgv

xmap <Tab>     <Plug>(neosnippet_expand_target)
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

" Add your own mapping. For example:
noremap <silent> <A-e> :call ToggleNetrw()<CR>

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

nnoremap <leader>fs :set foldmethod=syntax<cr>

nmap <Leader>l :Limelight!!<cr>
nnoremap <A-s> :m .+1<CR>==
nnoremap <A-w> :m .-2<CR>==
inoremap <A-s> <Esc>:m .+1<CR>==gi
inoremap <A-w> <Esc>:m .-2<CR>==gi
vnoremap <A-s> :m '>+1<CR>gv=gv
vnoremap <A-w> :m '<-2<CR>gv=gv

nnoremap <leader>sq vi'"+y
vnoremap <leader>y "+y
