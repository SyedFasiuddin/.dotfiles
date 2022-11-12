require("luaaa.plugins")
require("luaaa.set")
require("luaaa.keymaps")

vim.cmd[[autocmd BufWritePre *.txt :%s/\s\+$//e]]
