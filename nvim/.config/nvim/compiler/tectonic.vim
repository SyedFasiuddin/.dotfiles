" Vim compiler file
" Compiler:         LaTeX Compiler
" Maintainer:       Syed Fasiuddin <syedfasiuddin.02@gmail.com>

if exists("current_compiler")
    finish
endif
let current_compiler = "tectonic"

let s:cpo_save = &cpo
set cpo&vim

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

if exists("g:tectonic_v2_interface") && g:tectonic_v2_interface != 0
    CompilerSet makeprg=tectonic\ -X\ build\ \\\|&\ tectonic_err_filter
else
    CompilerSet makeprg=tectonic\ \%:S
endif

CompilerSet errorformat=%t%*[^:]:\ %f:%l:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save
