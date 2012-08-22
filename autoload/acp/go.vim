if exists("acp_did_go") | finish | endif
let acp_did_go = 1

function acp#go#meetsForOmni(context)
	return g:acp_behaviorGoOmniLength >= 0 &&
				\ a:context =~ '\k\.\k\{' . g:acp_behaviorGoOmniLength . ',}$'
endfunction

function acp#go#makeBehavior()
	let behavs = acp#getDefaults('go')
	"---------------------------------------------------------------------------
	call add(behavs.go, {
				\ 'command' : "\<C-x>\<C-o>",
				\ 'meets'   : 'acp#go#meetsForOmni',
				\ 'repeat'  : 0,
				\ })
	return behavs
endfunction
