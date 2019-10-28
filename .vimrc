syntax on
filetype plugin indent on

" Set Comment's color
" https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
" https://codeyarns.com/2011/07/29/vim-chart-of-color-names
highlight Comment ctermfg=33
highlight netrwDir ctermfg=184

" Keys map:
"   Ctrl + key     : <C-key>
"   Shift + key    : <S-key>
"   Alt + key      : <A-key> or <M-key>
"   Super + key    : <D-key>
"   Tab            : <Tab>
"   Enter          : <CR>
"   Space          : <space>
"   Esc            : <esc>
"   Arrow keys     : <left>, <right>, <up>, <down>
"   Mix keys       : Ctrl + Shift + F3: <C-S-F3>

set tags=./tags,./TAGS,tags,TAGS
set laststatus=2
set hlsearch
set ruler

" =In vim:/\csearch_key
" set ignorecase

" For show Japanese
" set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set encoding=utf-8

" Set indent
let tab_size = 2
execute "set shiftwidth=".tab_size
execute "set tabstop=".tab_size
set expandtab

" For Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" Auto open netrw
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter *.php,*.rb,*.js,*.ts,*.html,*.graphql  :Vexplore
augroup END

nnoremap <esc><esc><esc><esc> :noh<CR>

nnoremap -- I<!--<esc>A--><esc>
nnoremap --= ^dt<$<left><left>D
inoremap ><< ><esc>yypa/<esc><up>yyp^C<space><space>
inoremap ()h ()<left>
inoremap ""h ""<left>
inoremap ''h ''<left>
nnoremap yo yypC
nnoremap ; :

" For Ctags
nnoremap <C-]><C-]> <C-]>
nnoremap <C-]><C-[> yiw:ts<space><C-r>"?<CR>1<CR><CR>

" Auto indent
inoremap {}<CR> {}<esc>i<CR><esc><up>o
" inoremap {}<CR> {<esc>yypC}<esc><up>yypC<space><space><space><space>
" inoremap {}<CR> {<esc>yypC}<esc><up>yypC<space><space>

"add jbuilder syntax highlighting
au BufNewFile,BufRead *.jbuilder set ft=ruby

"add firestore.rules syntax highlighting
au BufNewFile,BufRead *.rules set ft=javascript

"add cakephp template .ctp syntax highlighting
au BufNewFile,BufRead *.ctp set ft=php

"add Velocity Template Language syntax highlighting .vtl
au BufNewFile,BufRead *.vtl set ft=vm

"--------------------------Move cursor in Ruby------------------------
"Move to next/previous line with same indentation
function! NextIndent(fwd)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if (indent(line) == indent)
      if (strlen(getline(line)) > 0)
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

nnoremap <silent> zj :call NextIndent(1)<CR>
nnoremap <silent> zk :call NextIndent(0)<CR>
"nnoremap <silent> << :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
"nnoremap <silent> >> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>
"-------------------------- End ------------------------
