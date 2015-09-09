if exists("loaded_smartclist")
    finish
else
    let loaded_smartclist = 1
endif

function SmartClist_PNav(next)
	try
		wincmd P
	catch
		return
	endtry

	try
		if a:next == 1
			cnext
		else
			cprev
		endif
	catch
		echo "Unable to navigate"
	endtry
	normal zt
	normal 2k2j
	wincmd p
endfunction
