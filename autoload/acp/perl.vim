if exists("acp_did_perl") | finish | endif
let acp_did_perl = 1
"
function acp#perl#meetsForOmni(context)
  return g:acp_behaviorPerlOmniLength >= 0 &&
        \ a:context =~ '\w->\k\{' . g:acp_behaviorPerlOmniLength . ',}$'
endfunction

function acp#perl#makeBehavior()
	let behavs = acp#getDefaults('perl')
	"---------------------------------------------------------------------------
	call add(behavs.perl, {
				\   'command' : "\<C-x>\<C-o>",
				\   'meets'   : 'acp#perl#meetsForOmni',
				\   'repeat'  : 0,
				\ })
	return behavs
endfunction


