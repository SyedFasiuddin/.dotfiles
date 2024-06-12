" Vim compiler file
" Compiler:         `shellcheck` <https://www.shellcheck.net/>
" Maintainer:       Syed Fasiuddin <syedfasiuddin.02@gmail.com>
" Credits:          Joshua Priddle <https://github.com/itspriddle/vim-shellcheck>

if exists("current_compiler")
    finish
endif
let current_compiler = "shellcheck"

let s:cpo_save = &cpo
set cpo&vim

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=shellcheck\ -f\ gcc\ $*\ \%:S
CompilerSet errorformat=%f:%l:%c:\ %t%*[^:]:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save
