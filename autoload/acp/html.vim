if exists("acp_did_html") | finish | endif
let acp_did_html = 1

function acp#html#meetsForOmni(context)
	return g:acp_behaviorHtmlOmniLength >= 0 &&
				\ a:context =~ '\(<\|<\/\|<[^>]\+ \|<[^>]\+=\"\)\k\{' .
				\              g:acp_behaviorHtmlOmniLength . ',}$'
endfunction

function acp#html#makeBehavior()
	let behavs = acp#getDefaults('html')
	"---------------------------------------------------------------------------
	call add(behavs.html, {
				\ 'command' : "\<C-x>\<C-o>",
				\ 'meets'   : 'acp#html#meetsForOmni',
				\ 'repeat'  : 1,
				\ })
	return behavs
endfunction
