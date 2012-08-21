function acp#go#meetsForOmni(context)
	let s:min_len_for_omni = 0
	return a:context =~ '\k\.\k\{' . s:min_len_for_omni . ',}$'
endfunction

function acp#go#makeBehavior()
	"let behavs = { 'go' : [] }
	let behavs = acp#behav#defaults('go')
	"---------------------------------------------------------------------------
	call add(behavs.go, {
				\   'command' : "\<C-x>\<C-o>",
				\   'meets'   : 'acp#go#meetsForOmni',
				\   'repeat'  : 0,
				\ })
	return behavs
endfunction


