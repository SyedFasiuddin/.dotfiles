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
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "plaintex", "latex", "tex", "markdown", "text", "org" },
    callback = function ()
        vim.opt_local.textwidth = 80
    end,
})
