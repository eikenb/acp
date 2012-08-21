"
function acp#perl#meetsForOmni(context)
  return g:acp_behaviorPerlOmniLength >= 0 &&
        \ a:context =~ '\w->\k\{' . g:acp_behaviorPerlOmniLength . ',}$'
endfunction

function acp#perl#makeBehavior()
	let behavs = acp#behav#defaults('perl')
	"---------------------------------------------------------------------------
	call add(behavs.perl, {
				\   'command' : "\<C-x>\<C-o>",
				\   'meets'   : 'acp#perl#meetsForOmni',
				\   'repeat'  : 0,
				\ })
	return behavs
endfunction


