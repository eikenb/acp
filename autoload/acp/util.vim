
function acp#util#defineOption(name, default)
	if !exists(a:name)
		let {a:name} = a:default
	endif
endfunction

