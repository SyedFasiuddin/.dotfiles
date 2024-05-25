return {
    "neovim/nvim-lspconfig",
    cmd = "LspStart",
    config = function()
        local lspconfig = require("lspconfig")

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
                end,
                capabilities = vim.lsp.protocol.make_client_capabilities(),
            })
        end
    end
}
