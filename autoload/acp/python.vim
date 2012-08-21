function acp#python#meetsForOmni(context)
	return has('python') && g:acp_behaviorPythonOmniLength >= 0 &&
			\ a:context =~ '\k\.\k\{' . g:acp_behaviorPythonOmniLength . ',}$'
endfunction

function acp#python#makeBehavior()
	let behavs = acp#behav#defaults('python')
	"---------------------------------------------------------------------------
	call add(behavs.python, {
				\   'command' : "\<C-x>\<C-o>",
				\   'meets'   : 'acp#python#meetsForOmni',
				\   'repeat'  : 0,
				\ })
	return behavs
endfunction


