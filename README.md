ACP
---

ACP is a fork of autocomplpop 2.14.1. I liked the auto-completion feature and
preferred the much simpler code of autocomplpop to the alternatives. But it
seemed like it was no longer supported and was structured in a monolithic way
that made it hard to extend.

This fork is to provide continued support and to refactor the code to make it
easier to extend.

Howto add new omni-completions
---

To add support for a new language, normally to add omni completion, you need to
add 2 files. An autoloaded file and a filetype plugin. The autoload file
provides the logic and the ftplugin sets the defaults and calls the autoload
function to setup completion for that filetype.

I've commented a few of the files more thoroughly to work as an example. Any of the files work as examples as they are all pretty simple. But for more comments see; ./ftplugin/perl.vim, ./autoload/acp/perl.vim and ./autoload/acp/css.vim.

