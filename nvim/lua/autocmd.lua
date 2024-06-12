vim.api.nvim_create_autocmd("BufWritePre", {
    command = [[ %s/\s\+$//e ]]
})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ timeout = 40 })
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (args)
        local bufopts = { noremap = true, silent = true, buffer = args.buf }

        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)

        vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<Leader>c", vim.lsp.buf.code_action, bufopts)

        vim.keymap.set("n", "<F3>", function()
            vim.lsp.buf.format({ async = true })
        end, bufopts)
    end,
})

vim.api.nvim_create_autocmd("LspDetach", {
    callback = function (args)
        local bufopts = { buffer = args.buf }

        vim.keymap.del("n", "K", bufopts)
        vim.keymap.del("n", "gr", bufopts)
        vim.keymap.del("n", "<Leader>r", bufopts)
        vim.keymap.del("n", "<Leader>c", bufopts)
        vim.keymap.del("n", "<F3>", bufopts)
    end,
})
