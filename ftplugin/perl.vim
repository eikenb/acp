" standard load guard so it is only loaded once (all that's needed)
if exists("did_acp_ft_perl") | finish | endif
let did_acp_ft_perl = 1

" Use defineOption to set any options that you use in your autoload methods.
call acp#defineOption('g:acp_behaviorPerlOmniLength', -1)
" Call your autoload/function which sets everything up.
call extend(g:acp_behavior, acp#perl#makeBehavior(), 'keep')
