return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    -- border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
                    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        -- package_uninstalled = "✗",
                    },
                },
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup()
        end
    },
}
