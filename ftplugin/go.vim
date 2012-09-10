if exists("did_acp_ft_go") | finish | endif
let did_acp_ft_go = 1

" Go omni completion is off by default. See docs for how to setup and enable.
call acp#defineOption('g:acp_behaviorGoOmniLength', -1)
call extend(g:acp_behavior, acp#go#makeBehavior(), 'keep')
