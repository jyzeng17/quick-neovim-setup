function! s:openTerminal()
	split
	wincmd j
	terminal
	resize 10
	startinsert
endfunction

command! Term call <SID>openTerminal()
