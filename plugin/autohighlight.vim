if exists("loaded_autohighlight")
    finish
else
    let loaded_autohighlight = 1
endif

let g:auto_highlight_word_enabled = 0
let g:auto_highlight_word_locked = 0
let g:cur_highlight_word = ""

function HighlightWord(word)
	" hi highlightWord term=bold ctermfg=blue ctermbg=yellow guifg=red guibg=#FFFF00
	hi highlightWord term=reverse ctermfg=0 ctermbg=40 guibg=Grey25
	let l:cmd = 'match highlightWord /\<\V' . a:word . '\>/' 
	execute l:cmd
endfunction

function HighlightWordCancel()
	match none
endfunction

function s:AutoHighlight(force_hl)
	if g:auto_highlight_word_enabled == 0
		return
	endif
	let l:word = expand("<cword>")
	if l:word != "" && l:word != "/" && l:word != "\\"
		if !a:force_hl && l:word == g:cur_highlight_word
			return
		endif
		if g:auto_highlight_word_locked
			return
		endif
		let g:cur_highlight_word = l:word
		call HighlightWord(g:cur_highlight_word)
	endif
endfunction

function AutoHighlight_ToggleLock()
	let g:auto_highlight_word_locked = ! g:auto_highlight_word_locked
	if g:auto_highlight_word_locked == 0
		echo "Auto Highlight Lock OFF"
	else
		echo "Auto Highlight Lock ON"
	endif
endfunction

function AutoHighlight_Toggle()
	if g:auto_highlight_word_enabled == 0
		let g:auto_highlight_word_enabled = 1
		let g:auto_highlight_word_locked = 0
		exe "set updatetime=200"
		call s:AutoHighlight(1)
		echo "Auto Highlight ON"
	else
		let g:auto_highlight_word_enabled = 0
		call HighlightWordCancel()
		echo "Auto Highlight OFF"
	endif
endfunction

" autocmd CursorMoved * call s:AutoHighlight()
autocmd CursorHold * nested call s:AutoHighlight(0)
