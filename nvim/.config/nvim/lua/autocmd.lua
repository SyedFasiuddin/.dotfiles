vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.cmd [[ hi Normal      ctermbg=NONE guibg=NONE ]]
        vim.cmd [[ hi NormalFloat ctermbg=NONE guibg=NONE ]]
    end
})

vim.api.nvim_create_autocmd("BufWritePre", {
    command = [[ %s/\s\+$//e ]]
})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ timeout = 40 })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "plaintex", "latex", "tex", "gitcommit", "markdown", "text", "org" },
    callback = function ()
        local o = vim.opt_local
        o.wrap = false
        o.spell = true
        o.spelllang:append("en_us")
        local spellfile_en = os.getenv("HOME") .. "/.vim/spell/en.utf-8.add"
        o.spellfile:append(spellfile_en)
        o.dictionary:append("/usr/share/dict/words")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "plaintex", "latex", "tex", "markdown", "text", "org" },
    callback = function ()
        vim.opt_local.textwidth = 80
    end,
})
