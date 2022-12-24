require("luaaa.plugins")
require("luaaa.set")
require("luaaa.keymaps")

vim.cmd [[autocmd BufWritePre * :%s/\s\+$//e]]

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({
            timeout = 40,
        })
    end,
    group = highlight_group,
    pattern = '*',
})
-- kickstart.nvim and ThePrimeagen
