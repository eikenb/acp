
call acp#util#defineOption('g:acp_behaviorGoOmniLength', 0)

function MeetsForGoOmni(context)
	return g:acp_behaviorGoOmniLength >= 0 &&
				\ a:context =~ '\k\.\k\{' . g:acp_behaviorGoOmniLength . ',}$'
endfunction

function s:makeGoBehavior()
	"let behavs = { 'go' : [] }
	let behavs = acp#behav#defaults('go')
	"---------------------------------------------------------------------------
	call add(behavs.go, {
				\   'command' : "\<C-x>\<C-o>",
				\   'meets'   : 'MeetsForGoOmni',
				\   'repeat'  : 0,
				\ })
	return behavs
endfunction

call extend(g:acp_behavior, s:makeGoBehavior(), 'keep')

