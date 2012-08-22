if exists("acp_did_behav") | finish | endif
let acp_did_behav = 1

function acp#behav#defaults(key)
	let behavs = { a:key : [] }
	"---------------------------------------------------------------------------
	call add(behavs[a:key], acp#snipmate#getBehavior(a:key))
	"---------------------------------------------------------------------------
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
				\   'command' : g:acp_behaviorKeywordCommand,
				\   'meets'   : 'acp#behav#meetsForKeyword',
				\   'repeat'  : 0,
				\ })
	"---------------------------------------------------------------------------
	call add(behavs[a:key], {
				\   'command' : "\<C-x>\<C-f>",
				\   'meets'   : 'acp#behav#meetsForFile',
				\   'repeat'  : 0,
				\ })
	return behavs
endfunction

"
function acp#behav#meetsForKeyword(context)
  if g:acp_behaviorKeywordLength < 0
    return 0
  endif
  let matches = matchlist(a:context, '\(\k\{' . g:acp_behaviorKeywordLength . ',}\)$')
  if empty(matches)
    return 0
  endif
  for ignore in g:acp_behaviorKeywordIgnores
    if stridx(ignore, matches[1]) == 0
      return 0
    endif
  endfor
  return 1
endfunction

"
function acp#behav#meetsForFile(context)
  if g:acp_behaviorFileLength < 0
    return 0
  endif
  if has('win32') || has('win64')
    let separator = '[/\\]'
  else
    let separator = '\/'
  endif
  if a:context !~ '\f' . separator . '\f\{' . g:acp_behaviorFileLength . ',}$'
    return 0
  endif
  return a:context !~ '[*/\\][/\\]\f*$\|[^[:print:]]\f*$'
endfunction


