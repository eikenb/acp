if exists("did_acp_ft_go") | finish | endif
let did_acp_ft_go = 1

call acp#defineOption('g:acp_behaviorGoOmniLength', 0)
call extend(g:acp_behavior, acp#go#makeBehavior(), 'keep')
