" Vim compiler file
" Compiler:         `tectonic` <https://tectonic-typesetting.github.io/>
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

" What does the command line look like?
" tectonic -X build |& sed 's/: \(.*\):/: src\/\1:/'
" NOTE this assumes that `sed` exists which might not be true for windows
if exists("g:tectonic_v2_interface") && g:tectonic_v2_interface != 0
    CompilerSet makeprg=tectonic\ -X\ build\ $*\ \\\|&\ sed\ \'s/:\ \\(\.\*\\):/:\ src\\/\\1:/\'
else
    CompilerSet makeprg=tectonic\ \%:S
endif

CompilerSet errorformat=%t%*[^:]:\ %f:%l:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save
