:let g:loaded_debug = 1
:let s:save_cpo = &cpo
:set cpo&vim
" skeleton
:function! Skeleton()
    :let frame = [
		\ 'package main',
		\ 'import ("bufio";"os";"strings";"strconv";"fmt";)',
		\ 'var In *bufio.Reader',
		\ 'var Out *bufio.Writer',
		\ 'func out (s string) { Out.WriteString(s) }',
		\ 'func outInt (i int) { Out.WriteString(strconv.Itoa(i)) }',
		\ 'func outFloat (f float64, prec int) { Out.WriteString(strconv.FormatFloat(f, ''f'', prec, 64) + "\n") }',
		\ 'func in () (res byte) { res, _ = In.ReadByte(); return }',
		\ 'func inStr () (string) { res, _ := In.ReadString(''\n''); return strings.Trim(res, "\n") }',
		\ 'func inInt () (res int) {',
		\ '    c := in();',
		\ '    minus := false',
		\ '    for ; c < ''0'' || ''9'' < c; c = in() {',
		\ '        if c == ''-'' { minus = true }',
		\ '    }',
		\ '    for ; ''0'' <= c && c <= ''9''; c = in() {',
		\ '        res = 10 * res + int(c - ''0'')',
		\ '    }',
		\ '    if minus { res = -1 * res }',
		\ '    return',
		\ '}',
		\ 'func inInt64 () (res int64) {',
		\ '    c := in();',
		\ '    minus := false',
		\ '    for ; c < ''0'' || ''9'' < c; c = in() {',
		\ '        if c == ''-'' { minus = true }',
		\ '    }',
		\ '    for ; ''0'' <= c && c <= ''9''; c = in() {',
		\ '        res = 10 * res + int64(c - ''0'')',
		\ '    }',
		\ '    if minus { res = -1 * res }',
		\ '    return',
		\ '}',
		\ 'func inFloat () (res float64) {',
		\ '    for c := in(); c != ''.''; c = in() {',
		\ '        res = 10.0 * res + float64(c - ''0'')',
		\ '    }',
		\ '    for c,i := in(),10.0; ''0'' <= c && c <= ''9''; c,i = in(),i*10.0 {',
		\ '        res = res + (float64(c - ''0'') / i)',
		\ '    }',
		\ '    return',
		\ '}',
		\ 'func initialize () {',
		\ '    In  = bufio.NewReader(os.Stdin)',
		\ '    Out = bufio.NewWriter(os.Stdout)',
		\ '}',
		\ '',
		\ 'func main () {',
		\ '    initialize()',
		\ '    T := inInt()',
		\ '    for ; 0 < T; T-- {',
		\ '        N := inInt()',
		\ '        //write',
		\ '    }',
		\ '    Out.Flush()',
		\ '}',
    \ ]
    :let i = 0
    :for str in frame
        :call append(i, str)
        :let i = i + 1
    :endfor
:endfunction
:command! Skel :call Skeleton()


:let &cpo = s:save_cpo
:finish
