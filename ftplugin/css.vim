if exists("did_acp_ft_css") | finish | endif
let did_acp_ft_css = 1

" tweak default options
call acp#defineOption('g:acp_behaviorCssOmniPropertyLength', 1)
call acp#defineOption('g:acp_behaviorCssOmniValueLength', 0)
" Call autoload/function to set everything up and add to acp's behaviour.
call extend(g:acp_behavior, acp#css#makeBehavior(), 'keep')
