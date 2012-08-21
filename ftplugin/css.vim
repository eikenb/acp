call acp#defineOption('g:acp_behaviorCssOmniPropertyLength', 1)
call acp#defineOption('g:acp_behaviorCssOmniValueLength', 0)

call extend(g:acp_behavior, acp#css#makeBehavior(), 'keep')
