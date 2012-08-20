
function s:defineOption(name, default)
  if !exists(a:name)
    let {a:name} = a:default
  endif
endfunction

call s:defineOption('g:acp_behaviorGoOmniLength', 0)


function MeetsForGoOmni(context)
  return g:acp_behaviorGoOmniLength >= 0 &&
        \ a:context =~ '\k\.\k\{' . g:acp_behaviorGoOmniLength . ',}$'
endfunction


function s:makeGoBehavior()
  let behavs = {
        \   'go'    : [],
        \ }
  "---------------------------------------------------------------------------
  call add(behavs.go, {
		\   'command'      : "\<C-x>\<C-u>",
		\   'completefunc' : g:acp_behaviorUserDefinedFunction,
		\   'meets'        : g:acp_behaviorUserDefinedMeets,
		\   'repeat'       : 0,
		\ })
  "---------------------------------------------------------------------------
	call add(behavs.go, {
		  \   'command'      : "\<C-x>\<C-u>",
		  \   'completefunc' : 'acp#completeSnipmate',
		  \   'meets'        : 'acp#meetsForSnipmate',
		  \   'onPopupClose' : 'acp#onPopupCloseSnipmate',
		  \   'repeat'       : 0,
		  \ })
  "---------------------------------------------------------------------------
    call add(behavs.go, {
          \   'command' : g:acp_behaviorKeywordCommand,
          \   'meets'   : 'acp#meetsForKeyword',
          \   'repeat'  : 0,
          \ })
  "---------------------------------------------------------------------------
    call add(behavs.go, {
          \   'command' : "\<C-x>\<C-f>",
          \   'meets'   : 'acp#meetsForFile',
          \   'repeat'  : 0,
          \ })
"---------------------------------------------------------------------------
  call add(behavs.go, {
        \   'command' : "\<C-x>\<C-o>",
        \   'meets'   : 'MeetsForGoOmni',
        \   'repeat'  : 0,
        \ })
  return behavs
endfunction

call extend(g:acp_behavior, s:makeGoBehavior(), 'keep')

