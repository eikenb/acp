if exists("acp_did_behav") | finish | endif
let acp_did_behav = 1

function acp#behav#defaults(key)
	let behavs = { a:key : [] }
	if !empty(g:acp_behaviorUserDefinedFunction) &&
				\ !empty(g:acp_behaviorUserDefinedMeets)
		call add(behavs[a:key], {
					\   'command'      : "\<C-x>\<C-u>",
					\   'completefunc' : g:acp_behaviorUserDefinedFunction,
					\   'meets'        : g:acp_behaviorUserDefinedMeets,
					\   'repeat'       : 0,
					\ })
	endif
	"---------------------------------------------------------------------------
	call add(behavs[a:key], {
				\   'command'      : "\<C-x>\<C-u>",
				\   'completefunc' : 'acp#completeSnipmate',
				\   'meets'        : 'acp#meetsForSnipmate',
				\   'onPopupClose' : 'acp#onPopupCloseSnipmate',
				\   'repeat'       : 0,
				\ })
	"---------------------------------------------------------------------------
	call add(behavs[a:key], {
				\   'command' : g:acp_behaviorKeywordCommand,
				\   'meets'   : 'acp#meetsForKeyword',
				\   'repeat'  : 0,
				\ })
	"---------------------------------------------------------------------------
	call add(behavs[a:key], {
				\   'command' : "\<C-x>\<C-f>",
				\   'meets'   : 'acp#meetsForFile',
				\   'repeat'  : 0,
				\ })
	return behavs
endfunction
