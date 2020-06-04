
" Vimux configuration and mapping
let g:VimuxOrientation = "v"

map <Leader>rr :call VimuxRunCommand("cd " . getcwd() . ";clear; npm run integrationtest")<CR>
" map <Leader>r :call VimuxRunCommand(expand('%:h'). "clear; npm run integrationtest")<CR>
map <Leader>rt :call VimuxRunCommand("
      \clear;
      \ npm run cover:integration
      \ && npm run cover:report")<CR>

