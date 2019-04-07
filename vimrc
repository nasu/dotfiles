syntax on
set nobk
set noundofile
set ai

set tabstop=2
set shiftwidth=2
set expandtab
set backspace=2
set smarttab
set nocursorline
"set background=light
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  "autocmd WinEnter,BufRead * set cursorline
set clipboard=unnamed,autoselect
set grepprg=git\ grep\ --no-index\ -I\ --line-number\ --no-color
augroup END
hi clear CursorLine
hi CursorLine gui=underline
hi CursorLine ctermbg=red guibg=red

nmap <ESC><ESC> :noh<CR><ESC>
cmap <expr> %%% expand("<cword>")
xmap ga <Plug>(EasyAlign)

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
autocmd BufNewFile,BufRead *.cs set tabstop=4 shiftwidth=4 expandtab
let g:user_zen_settings = { 'indentation' : "\t" }
" for React.js
"let g:jsx_ext_required = 0
autocmd BufNewFile,BufRead *.tag set filetype=html tabstop=2 shiftwidth=2 noexpandtab
"""
let g:ctrlp_use_migemo = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_mruf_max = 500
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|pkg$\|vendor$',
  \}
"""

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
"colorscheme default2

if &term=="xterm"
  set t_Co=8
  set t_Sb=[4%dm
  set t_Sf=[3%dm
endif
map!  
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set laststatus=2
set showmatch

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
let g:go_fmt_command = 'goimports'
"let g:go_def_mapping_enabled = 1
"
" " Go に付属の plugin と gocode を有効にする
set rtp^=${GOROOT}/misc/vim
set rtp^=${GOPATH}/src/github.com/nsf/gocode/vim

" 保存時に :Fmt する
au BufWritePre *.go Fmt
au BufNewFile,BufRead *.go set sw=4 noexpandtab ts=4
au FileType go compiler go
"function! s:remove_dust()
"    let cursor = getpos(".")
"    %s/\s\+$//ge
"    %s/\t/    /ge
"    call setpos(".", cursor)
"    unlet cursor
"endfunction
au BufWritePre *.go GoImports
"autocmd BufWritePre * call <SID>remove_dust()
autocmd FileType go command! GDV call go#def#Jump('vsplit')
autocmd FileType go command! GDH call go#def#Jump('split')
autocmd FileType go command! GD call go#def#Jump('')
autocmd FileType go command! GI call go#fmt#Format(1)
autocmd Filetype go command! -bang GAV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd FileType go command! -range=% GR call go#guru#Referrers(<count>)
autocmd Filetype go set foldmethod=syntax
au BufNewFile,BufRead *.template set syntax=gotexttmpl

""" powerline
set laststatus=2
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'
set noshowmode

""" dein.vim
filetype plugin indent off
if &compatible
  set nocompatible
endif
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/dein.vim')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
colorscheme PaperColor
