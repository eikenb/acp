if exists("did_acp_ft_html") | finish | endif
let did_acp_ft_html = 1

call acp#defineOption('g:acp_behaviorHtmlOmniLength', 0)
call extend(g:acp_behavior, acp#html#makeBehavior(), 'keep')
