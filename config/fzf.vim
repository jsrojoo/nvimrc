" FZF autocommands
"
"
if has("nvim")
    " Escape inside a FZF terminal window should exit the terminal window
    " rather than going into the terminal's normal mode.
    autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
endif

" FZF mappings
"
"
nnoremap <leader>g :Ag<Space>
nnoremap <leader>af :Files<CR>
nnoremap <leader>t :GFiles<CR>
nnoremap <leader>ff :Files <C-r>=expand("%:h")<CR>/<CR>
" nnoremap <leader>ff :FZF<CR>
nnoremap <leader>h :Helptags<CR>
nnoremap <leader>ss :BLines<CR>
nnoremap <leader>cw :Rg <C-R><C-W><CR>
nnoremap <leader>cc :Commands<CR>
nnoremap <leader>e :Buffers<CR>
nnoremap <leader>m :Maps<CR>
