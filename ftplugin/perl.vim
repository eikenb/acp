if exists("did_acp_ft_perl") | finish | endif
let did_acp_ft_perl = 1

call acp#defineOption('g:acp_behaviorPerlOmniLength', -1)
call extend(g:acp_behavior, acp#perl#makeBehavior(), 'keep')
