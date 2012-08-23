" standard load guard so it is only loaded once (all that's needed)
if exists("acp_did_perl") | finish | endif
let acp_did_perl = 1

" This is the function that gets called to check whether to call the omni
" completion. It should return a boolean (0/1).
"
" It is passed the 'context' or the current line from the beginning up to the
" cursor. See the s:getCurrentText() function in autoload/acp.vim.
function acp#perl#meetsForOmni(context)
	" the length variable here can disable omni complete, if less the 0,
	" otherwise it specifies the number of characters that must be typed
	" before the pattern will match and completion is triggered.
	return g:acp_behaviorPerlOmniLength >= 0 &&
				\ a:context =~ '\w->\k\{' . g:acp_behaviorPerlOmniLength . ',}$'
endfunction

" This function sets up all the auto completion for this filetype.
function acp#perl#makeBehavior()
	" It starts with setting the defaults, which include file, keyword and
	" optionally snipmate and user defined completions as discussed in the
	" docs. You need to pass in the name of the filetype you are working with.
	let behavs = acp#getDefaults('perl')
	" behavs is a list of dictionaries containing the data needed for the
	" completion system.
	"---------------------------------------------------------------------------
	" The contents of the dictionay are explained in the documentation.
	" Again the name here must match the filetype.
	call add(behavs.perl, {
				\ 'command' : "\<C-x>\<C-o>",
				\ 'meets'   : 'acp#perl#meetsForOmni',
				\ 'repeat'  : 0,
				\ })
	return behavs
endfunction
