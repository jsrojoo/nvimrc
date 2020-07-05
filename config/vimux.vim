
" Vimux configuration and mapping
let g:VimuxOrientation = "v"

map <silent><Leader>rr :call VimuxRunCommand("cd " . getcwd() . ";clear; npm run integrationtest")<CR>
" map <Leader>r :call VimuxRunCommand(expand('%:h'). "clear; npm run integrationtest")<CR>
map <silent><Leader>rt :call VimuxRunCommand("cd " . getcwd() . ";clear;npm run cover:integration && npm run cover:report")<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
