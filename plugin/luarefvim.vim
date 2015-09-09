" luarefvim plugin
" This is somewhat based on CRefVim
" Maintainer: Luis Carvalho <lexcarvalho@gmail.com>
" Last Change: Jun, 3, 2005
" Version: 0.2
" Modified: Jerry Hong <hongy3025@gmail.com>

" initial setup: avoid loading more than once
if exists("loaded_luarefvim")
	finish
endif
let loaded_luarefvim = 1

" mappings:
vmap <silent> <Leader>lr y:call <SID>LookUp('<c-r>"')<CR>
nmap <silent> <Leader>lr  :call <SID>LookUp(expand("<cword>"))<CR>
map <silent> <Leader>lc :help luaref<CR>

vmap <silent> <s-F12> y:call <SID>LookUp('<c-r>"')<CR>
nmap <silent> <s-F12> :call <SID>LookUp(expand("<cword>"))<CR>:execute "wincmd j"<cr>
imap <silent> <s-F12> <esc>:call <SID>LookUp(expand("<cword>"))<CR>:execute "wincmd j"<cr>

function <SID>LookUp(str)
	if a:str == "--" "comment?
		echo 'aaa'
		silent! execute ":help lrv-comment"
	elseif a:str == ""
		echo 'bbb'
		silent! execute ":help luaref"
	else
		echo 'ccc'
		silent! execute ":help lrv-" . a:str
"         if v:errmsg != ""
"             echo "luarefvim: \`" . a:str . "\' not found"
"         endif
	endif
endfunction

