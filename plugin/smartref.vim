if exists("loaded_smartref")
    finish
else
    let loaded_smartref = 1
endif

function SmartRef_FindRefInThisFile()
	normal mr
	exec 'vimgrep ' . '/\<\V' . expand('<cword>') . '\>/ ' . '%'
	call HighlightWord(l:this_word)
	clist
endfunction

function SmartRef_PFindRefInThisFile()
	let l:this_file = expand('%')
	let l:this_word = expand('<cword>')
	exec "belowright pedit " . l:this_file
	wincmd P
	exec 'vimgrep ' . '/\<\V' . l:this_word . '\>/ ' . '%'
	call HighlightWord(l:this_word)
	wincmd p
endfunction

function SmartRef_PGrepCurrentWord()
	let l:this_word = expand('<cword>')
	belowright pedit
	wincmd P
	exec 'vim ' . '/\<' . l:this_word . '\>/' . ' **'
	call HighlightWord(l:this_word)
	wincmd p
endfunction
