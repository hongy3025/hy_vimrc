if exists("loaded_smarttag")
    finish
else
    let loaded_smarttag = 1
endif

function SmartTag_PNav(next)
	let l:error = 0
	redir @y
	try
		if a:next == 1
			ptnext
		else
			ptprev
		endif
	catch
		let l:error = 1
	endtry
	redir END
	if l:error != 1
		let l:lines = split(@y,"\n")
		if len(l:lines)!=0
			echo l:lines[len(l:lines)-1]
		endif
	else
		if a:next
			echo "No more next tag"
		else
			echo "No more prev tag"
		endif
	endif
	silent! wincmd P
	silent! normal zt
	silent! wincmd p
endfunction

