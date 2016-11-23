if exists("loaded_hlsearch")
    finish
else
    let loaded_hlsearch = 1
endif

function ToggleHlsearch()
	redir @y
	silent setlocal hlsearch?
	redir END
	let l:m = match(@y,'nohlsearch')
	if l:m == -1
		setlocal nohlsearch
	else
		setlocal hlsearch
		" exe "normal *N"
	end
endfunc

noremap -  *N:setlocal hlsearch<cr>
noremap <space>i  :call ToggleHlsearch()<cr>
