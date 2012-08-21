" re-use html setup
function acp#xhtml#makeBehavior()
	let behavs = acp#behav#defaults('xhtml')
	"---------------------------------------------------------------------------
	call add(behavs.xhtml, {
				\   'command' : "\<C-x>\<C-o>",
				\   'meets'   : 'acp#html#meetsForOmni',
				\   'repeat'  : 1,
				\ })
	return behavs
endfunction

