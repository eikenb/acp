if exists("did_acp_ft_xml") | finish | endif
let did_acp_ft_xml = 1

call acp#defineOption('g:acp_behaviorXmlOmniLength', 0)
call extend(g:acp_behavior, acp#xml#makeBehavior(), 'keep')
