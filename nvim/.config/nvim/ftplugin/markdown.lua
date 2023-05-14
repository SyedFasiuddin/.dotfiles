local o = vim.opt_local

o.list = true
o.listchars:append("tab:>-")

o.spell = true
o.spelllang:append("en_us")

local spellfile_en = os.getenv("HOME") .. "/.vim/spell/en.utf-8.add"
o.spellfile:append(spellfile_en)

o.dictionary:append("/usr/share/dict/words")

o.textwidth = 80
o.number = false
o.relativenumber = false
