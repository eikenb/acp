if exists("acp_did_xml") | finish | endif
let acp_did_xml = 1

function acp#xml#meetsForOmni(context)
	return g:acp_behaviorXmlOmniLength >= 0 &&
				\ a:context =~ '\(<\|<\/\|<[^>]\+ \|<[^>]\+=\"\)\k\{' .
				\              g:acp_behaviorXmlOmniLength . ',}$'
endfunction

function acp#xml#makeBehavior()
	let behavs = acp#getDefaults('xml')
	"---------------------------------------------------------------------------
	call add(behavs.xml, {
				\ 'command' : "\<C-x>\<C-o>",
				\ 'meets'   : 'acp#xml#meetsForOmni',
				\ 'repeat'  : 1,
				\ })
	return behavs
endfunction
