syntax on
set nu
map <F4> <ESC>:q!<CR>
set csprg=/usr/bin/cscope
set cst
if filereadable("~/webos/cscope.out")
	cs add ~/webos/cscope.out
else
endif

