source ~/.local/share/nvim/site/config/defaults.vim

source ~/.local/share/nvim/site/config/plugins.vim

source ~/.local/share/nvim/site/config/colors.vim
source ~/.local/share/nvim/site/config/signify.vim
source ~/.local/share/nvim/site/config/fzf.vim
source ~/.local/share/nvim/site/config/netrw.vim
source ~/.local/share/nvim/site/config/vimux.vim
source ~/.local/share/nvim/site/config/nrrw_rgn.vim
source ~/.local/share/nvim/site/config/coc.vim

" unblevable/quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" lsp for vue using vls for vetur
let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }

" closetag config
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.vue, *.markdown'

" vimvue config
let g:vue_disable_pre_processors=1

" tag along config
let g:tagalong_filetypes = ['html', 'vue', 'md']

" markdown preview: browser to use when opening links / files like markdown
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

let g:python3_host_prog = '/home/rojo/.pyenv/versions/simone/bin/python'

" sneak hints
" let g:sneak#label = 1
" sneak search to use ignorecase and smartcase
let g:sneak#use_ic_scs = 1

highlight Sneak guifg=black guibg=red ctermfg=black ctermbg=red
highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow
highlight SneakLabel guifg=red guibg=yellow ctermfg=black ctermbg=yellow

" Smalls plugin
" map normal-mode 's' for simple search
nmap s <Plug>(smalls)
" if you want to use smalls in visual/operator or both mode.
omap s <Plug>(smalls)
xmap s <Plug>(smalls)
let g:smalls_shade = 0
" vim smalls plugin, make space character as trigger
let g:smalls_jump_keys= ' ABCDEFGHIJKLMNOPQRSTUVWXYZ'

" vimux mappings
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-n> :TmuxNavigateDown<cr>
nnoremap <silent> <M-e> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>

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

nnoremap <leader>cm :CocCommand markmap.create<cr>

" indent guide toggle
nnoremap <leader>id :IndentGuidesToggle<cr>
let g:indent_guides_auto_colors = 1
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=1
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=orange ctermbg=2

" yuttie/comfortable-motion.vim
let g:comfortable_motion_interval = 100 / 60
let g:comfortable_motion_friction = 300.0
let g:comfortable_motion_air_drag = 0.0

" vim over helper functions and mappings
function! VisualFindAndReplace()
    :OverCommandLine%s/
endfunction

function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
endfunction

nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>

