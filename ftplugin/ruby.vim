if exists("did_acp_ft_ruby") | finish | endif
let did_acp_ft_ruby = 1

call acp#defineOption('g:acp_behaviorRubyOmniMethodLength', 0)
call acp#defineOption('g:acp_behaviorRubyOmniSymbolLength', 1)
call extend(g:acp_behavior, acp#ruby#makeBehavior(), 'keep')
