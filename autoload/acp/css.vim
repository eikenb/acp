if exists("acp_did_css") | finish | endif
let acp_did_css = 1

" This meets function is a bit different than the others. It makes 2 checks
" and explicitly returns the 1/0 boolean. It also uses 2 variables. Other than
" that it works just like the others.
function acp#css#meetsForOmni(context)
	if g:acp_behaviorCssOmniPropertyLength >= 0 &&
				\ a:context =~ '\(^\s\|[;{]\)\s*\k\{' .
				\              g:acp_behaviorCssOmniPropertyLength . ',}$'
		return 1
	endif
	if g:acp_behaviorCssOmniValueLength >= 0 &&
				\ a:context =~ '[:@!]\s*\k\{' .
				\              g:acp_behaviorCssOmniValueLength . ',}$'
		return 1
	endif
	return 0
endfunction

function acp#css#makeBehavior()
	let behavs = acp#getDefaults('css')
	"---------------------------------------------------------------------------
	call add(behavs.css, {
				\ 'command' : "\<C-x>\<C-o>",
				\ 'meets'   : 'acp#css#meetsForOmni',
				\ 'repeat'  : 0,
				\ })
	return behavs
endfunction
