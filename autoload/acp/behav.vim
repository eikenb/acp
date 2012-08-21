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
	"---------------------------------------------------------------------------
	call add(behavs[a:key], {
				\   'command'      : "\<C-x>\<C-u>",
				\   'completefunc' : 'acp#behav#completeSnipmate',
				\   'meets'        : 'acp#behav#meetsForSnipmate',
				\   'onPopupClose' : 'acp#behav#onPopupCloseSnipmate',
				\   'repeat'       : 0,
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

"
function acp#behav#meetsForSnipmate(context)
  if g:acp_behaviorSnipmateLength < 0
    return 0
  endif
  let matches = matchlist(a:context, '\(^\|\s\|\<\)\(\u\{' .
        \                            g:acp_behaviorSnipmateLength . ',}\)$')
  return !empty(matches) && !empty(s:getMatchingSnipItems(matches[2]))
endfunction

"
function acp#behav#completeSnipmate(findstart, base)
  if a:findstart
    let s:posSnipmateCompletion = len(matchstr(s:getCurrentText(), '.*\U'))
    return s:posSnipmateCompletion
  endif
  let lenBase = len(a:base)
  let items = filter(GetSnipsInCurrentScope(),
        \            'strpart(v:key, 0, lenBase) ==? a:base')
  return map(sort(items(items)), 's:makeSnipmateItem(v:val[0], v:val[1])')
endfunction

"
function acp#behav#onPopupCloseSnipmate()
  let word = s:getCurrentText()[s:posSnipmateCompletion :]
  for trigger in keys(GetSnipsInCurrentScope())
    if word ==# trigger
      call feedkeys("\<C-r>=TriggerSnippet()\<CR>", "n")
      return 0
    endif
  endfor
  return 1
endfunction
