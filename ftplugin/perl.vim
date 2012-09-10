" standard load guard so it is only loaded once (all that's needed)
if exists("did_acp_ft_perl") | finish | endif
let did_acp_ft_perl = 1

" Use defineOption to set any options that you use in your autoload methods.
" Perl omni completion is off by default. See docs for how to setup and enable.
call acp#defineOption('g:acp_behaviorPerlOmniLength', -1)
" Call autoload/function to set everything up and add to acp's behaviour.
call extend(g:acp_behavior, acp#perl#makeBehavior(), 'keep')
