return {
    "neovim/nvim-lspconfig",
    cmd = "LspStart",
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        local on_attach = function(_, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }

            vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
            vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, bufopts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
            vim.keymap.set("n", "<Leader>c", vim.lsp.buf.code_action, bufopts)

            vim.keymap.set("n", "<F3>", function()
                vim.lsp.buf.format({ async = true })
            end, bufopts)
        end

        local servers = {
            "clangd",
            "pyright",
            "rust_analyzer",
            "texlab",
            "tsserver",
        }

        for _, value in pairs(servers) do
            lspconfig[value].setup({
                on_attach = function (client, bufnr)
                    if value == "clangd"  then
                        client.server_capabilities.signatureHelpProvider = false
                    end
                    client.server_capabilities.semanticTokensProvider = nil
                    on_attach(client, bufnr)
                end,
                capabilities = capabilities,
            })
        end
    end
}
