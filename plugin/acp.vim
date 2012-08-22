"=============================================================================
" Copyright (c) 2007-2009 Takeshi NISHIDA
"
" GetLatestVimScripts: 1879 1 :AutoInstall: AutoComplPop
"=============================================================================
" LOAD GUARD {{{1

if exists('g:loaded_acp')
  finish
elseif v:version < 702
  echoerr 'AutoComplPop does not support this version of vim (' . v:version . ').'
  finish
endif
let g:loaded_acp = 1

" }}}1
"=============================================================================
" FUNCTION: {{{1

"
function s:defineOption(name, default)
  if !exists(a:name)
    let {a:name} = a:default
  endif
endfunction

"
function s:makeDefaultBehavior()
  let behavs = acp#getDefaults('*')
  return behavs
endfunction

" }}}1
"=============================================================================
" INITIALIZATION {{{1

"-----------------------------------------------------------------------------
call s:defineOption('g:acp_enableAtStartup', 1)
call s:defineOption('g:acp_mappingDriven', 0)
call s:defineOption('g:acp_ignorecaseOption', 1)
call s:defineOption('g:acp_completeOption', '.,w,b,k')
call s:defineOption('g:acp_completeoptPreview', 0)
call s:defineOption('g:acp_behaviorUserDefinedFunction', '')
call s:defineOption('g:acp_behaviorUserDefinedMeets', '')
call s:defineOption('g:acp_behaviorSnipmateLength', -1)
call s:defineOption('g:acp_behaviorKeywordCommand', "\<C-n>")
call s:defineOption('g:acp_behaviorKeywordLength', 2)
call s:defineOption('g:acp_behaviorKeywordIgnores', [])
call s:defineOption('g:acp_behaviorFileLength', 0)
call s:defineOption('g:acp_behavior', {})
"-----------------------------------------------------------------------------
call extend(g:acp_behavior, s:makeDefaultBehavior(), 'keep')
"-----------------------------------------------------------------------------
command! -bar -narg=0 AcpEnable  call acp#enable()
command! -bar -narg=0 AcpDisable call acp#disable()
command! -bar -narg=0 AcpLock    call acp#lock()
command! -bar -narg=0 AcpUnlock  call acp#unlock()
"-----------------------------------------------------------------------------
" legacy commands
command! -bar -narg=0 AutoComplPopEnable  AcpEnable
command! -bar -narg=0 AutoComplPopDisable AcpDisable
command! -bar -narg=0 AutoComplPopLock    AcpLock
command! -bar -narg=0 AutoComplPopUnlock  AcpUnlock
"-----------------------------------------------------------------------------
if g:acp_enableAtStartup
  AcpEnable
endif
"-----------------------------------------------------------------------------

" }}}1
"=============================================================================
" vim: set fdm=marker:
