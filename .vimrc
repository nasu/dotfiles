syntax on
set nobk
set ai
helptags ~/.vim/doc

set tabstop=2
set shiftwidth=2
set expandtab
set backspace=2
set smarttab
set clipboard=unnamed,autoselect
set grepprg=git\ grep\ --no-index\ -I\ --line-number\ --no-color

set cursorline
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
hi clear CursorLine
hi CursorLine gui=underline
hi CursorLine ctermbg=red guibg=red

nmap <ESC><ESC> :noh<CR><ESC>
cmap <expr> %%% expand("<cword>")

filetype plugin on
autocmd BufNewFile,BufRead *.pm   set filetype=perl
autocmd BufNewFile,BufRead *.psgi set filetype=perl
autocmd BufNewFile,BufRead *.t    set filetype=perl
autocmd BufNewFile,BufRead *.js  set filetype=javascript
autocmd BufNewFile,BufRead *.jsx  set filetype=javascript
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufRead *.hbs  set filetype=handlebars
autocmd FileType perl :set tabstop=4 shiftwidth=4 expandtab
autocmd FileType perl :compiler perl
autocmd FileType javascript :compiler javascript
"autocmd FileType perl :set  encoding=euc-jp
"autocmd FileType html :set  encoding=sjis
"autocmd FileType sql  :set  encoding=sjis
"autocmd FileType sql  :set  termencoding=euc-jp
autocmd BufNewFile,BufRead *.tt  set filetype=tt2html
autocmd BufNewFile,BufRead *.tt  set tabstop=4 shiftwidth=4 noexpandtab
autocmd BufNewFile,BufRead *.js  set tabstop=4 shiftwidth=4 expandtab
autocmd BufNewFile,BufRead *.jsx set tabstop=4 shiftwidth=4 noexpandtab
autocmd BufNewFile,BufRead *.coffee set tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.py set tabstop=2 shiftwidth=2 expandtab
let g:user_zen_settings = { 'indentation' : "\t" }
" for React.js
"let g:jsx_ext_required = 0
autocmd BufNewFile,BufRead *.tag set filetype=html tabstop=2 shiftwidth=2 noexpandtab

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

if has("cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
"set background=dark
colorscheme hhdmagenta.modify

if &term=="xterm"
  set t_Co=8
  set t_Sb=[4%dm
  set t_Sf=[3%dm
endif
map!  
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set laststatus=2
set showmatch

"if &encoding !=# 'utf-8'
"  set encoding=japan
"  set fileencoding=japan
"endif
"if has('iconv')
"  let s:enc_euc = 'euc-jp'
"  let s:enc_jis = 'iso-2022-jp'
"  " iconv¤¬eucJP-ms¤ËÂÐ±þ¤·¤Æ¤¤¤ë¤«¤ò¥Á¥§¥Ã¥¯
"  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'eucjp-ms'
"    let s:enc_jis = 'iso-2022-jp-3'
"  " iconv¤¬JISX0213¤ËÂÐ±þ¤·¤Æ¤¤¤ë¤«¤ò¥Á¥§¥Ã¥¯
"  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'euc-jisx0213'
"    let s:enc_jis = 'iso-2022-jp-3'
"  endif
"  " fileencodings¤ò¹½ÃÛ
"  if &encoding ==# 'utf-8'
"    let s:fileencodings_default = &fileencodings
"    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
"    let &fileencodings = &fileencodings .','. s:fileencodings_default
"    unlet s:fileencodings_default
"  else
"    let &fileencodings = &fileencodings .','. s:enc_jis
"    set fileencodings+=utf-8,ucs-2le,ucs-2
"    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
"      set fileencodings+=cp932
"      set fileencodings-=euc-jp
"      set fileencodings-=euc-jisx0213
"      set fileencodings-=eucjp-ms
"      let &encoding = s:enc_euc
"      let &fileencoding = s:enc_euc
"    else
"      let &fileencodings = &fileencodings .','. s:enc_euc
"    endif
"  endif
"  " Äê¿ô¤ò½èÊ¬
"  unlet s:enc_euc
"  unlet s:enc_jis
"endif
"if has('autocmd')
"  function! AU_ReCheck_FENC()
"    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
"      let &fileencoding=&encoding
"    endif
"  endfunction
"  autocmd BufReadPost * call AU_ReCheck_FENC()
"endif
set fileformats=unix,dos,mac
if exists('&ambiwidth')
  set ambiwidth=double
endif
" automkdir
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force ||
    \    input(a:dir . ' does not exist. Create? [y/N]') =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}
let g:Align_xstrlen = 3

""" ref.vim
nmap ,ra :<C-u>Ref alc<Space>
let g:ref_alc_start_linenumber = 39
"let g:ref_alc_encoding = 'Shift-JIS'

" :Fmt などで gofmt の代わりに goimports を使う
let g:gofmt_command = 'goimports'

" Go に付属の plugin と gocode を有効にする
set rtp^=${GOROOT}/misc/vim
set rtp^=${GOPATH}/src/github.com/nsf/gocode/vim

" 保存時に :Fmt する
au BufWritePre *.go Fmt
au BufNewFile,BufRead *.go set sw=4 noexpandtab ts=4
au FileType go compiler go
function! s:remove_dust()
    let cursor = getpos(".")
    %s/\s\+$//ge
    %s/\t/    /ge
    call setpos(".", cursor)
    unlet cursor
endfunction
au BufWritePre *.go Fmt
autocmd BufWritePre * call <SID>remove_dust()

""" powerline
set laststatus=2
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'
set noshowmode

""" neobundle
set nocompatible
filetype plugin indent off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle'))
endif
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'https://github.com/Lokaltog/powerline.git'
NeoBundle 'https://github.com/kchmck/vim-coffee-script.git'
NeoBundle 'https://github.com/Lokaltog/powerline-fontpatcher'
NeoBundle 'fatih/vim-go'
NeoBundle 'burnettk/vim-angular'
NeoBundle 'seratch/vim-angular-coffee'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
if has('vim_starting')
  call neobundle#end()
endif 
filetype plugin indent on
