if exists("loaded_markHL") || &cp
  finish
endif
let loaded_markHL=1

hi HL_Marks term=reverse ctermfg=0 ctermbg=40 guibg=Grey25

function! HL_Marks()
	call clearmatches()
	call matchadd("HL_Marks", '\%' . line(".") . 'l')
endfunction

