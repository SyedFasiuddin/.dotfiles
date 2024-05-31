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
            lspconfig[value].setup({})
        end
    end
}
