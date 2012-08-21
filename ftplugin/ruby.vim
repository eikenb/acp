call acp#defineOption('g:acp_behaviorRubyOmniMethodLength', 0)
call acp#defineOption('g:acp_behaviorRubyOmniSymbolLength', 1)

call extend(g:acp_behavior, acp#ruby#makeBehavior(), 'keep')
