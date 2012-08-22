if exists("acp_did_snipmate") | finish | endif
let acp_did_snipmate = 1

" This is just here to gather together the snipmate related code. It is
" included into the default behaviour settings in ./behav.vim.
"
" To get this to work see the Snipmate section in the docs.

" Called to add snipmate indefaults
function acp#snipmate#getBehavior(key)
	return {
				\ 'command'      : "\<C-x>\<C-u>",
				\ 'completefunc' : 'acp#snipmate#completeSnipmate',
				\ 'meets'        : 'acp#snipmate#meetsForSnipmate',
				\ 'onPopupClose' : 'acp#snipmate#onPopupCloseSnipmate',
				\ 'repeat'       : 0,
				\ }
endfunction

function acp#snipmate#meetsForSnipmate(context)
	if g:acp_behaviorSnipmateLength < 0
		return 0
	endif
	let matches = matchlist(a:context, '\(^\|\s\|\<\)\(\u\{' .
				\ g:acp_behaviorSnipmateLength . ',}\)$')
	return !empty(matches) && !empty(s:getMatchingSnipItems(matches[2]))
endfunction

function acp#snipmate#completeSnipmate(findstart, base)
	if a:findstart
		let s:posSnipmateCompletion = len(matchstr(s:getCurrentText(), '.*\U'))
		return s:posSnipmateCompletion
	endif
	let lenBase = len(a:base)
	let items = filter(GetSnipsInCurrentScope(),
				\ 'strpart(v:key, 0, lenBase) ==? a:base')
	return map(sort(items(items)), 's:makeSnipmateItem(v:val[0], v:val[1])')
endfunction

function acp#snipmate#onPopupCloseSnipmate()
	let word = s:getCurrentText()[s:posSnipmateCompletion :]
	for trigger in keys(GetSnipsInCurrentScope())
		if word ==# trigger
			call feedkeys("\<C-r>=TriggerSnippet()\<CR>", "n")
			return 0
		endif
	endfor
	return 1
endfunction

"=============================================================================
" LOCAL FUNCTIONS: {{{1

function s:makeSnipmateItem(key, snip)
	if type(a:snip) == type([])
		let descriptions = map(copy(a:snip), 'v:val[0]')
		let snipFormatted = '[MULTI] ' . join(descriptions, ', ')
	else
		let snipFormatted = substitute(a:snip, '\(\n\|\s\)\+', ' ', 'g')
	endif
	return  {
				\ 'word': a:key,
				\ 'menu': strpart(snipFormatted, 0, 80),
				\ }
endfunction

let s:snipItems = {}
function s:getMatchingSnipItems(base)
	let key = a:base . "\n"
	if !exists('s:snipItems[key]')
		let s:snipItems[key] = items(GetSnipsInCurrentScope())
		call filter(s:snipItems[key],
		'strpart(v:val[0], 0, len(a:base)) ==? a:base')
		call map(s:snipItems[key], 's:makeSnipmateItem(v:val[0], v:val[1])')
	endif
	return s:snipItems[key]
endfunction

function s:getCurrentText()
	return strpart(getline('.'), 0, col('.') - 1)
endfunction

" }}}1

