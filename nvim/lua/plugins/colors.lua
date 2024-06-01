return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        opts = {
            italic = {
                strings = false,
            },
            invert_selection = true,
            contrast = "hard",
            transparent_mode = true,

            overrides = {
                WinSeparator = { bg = "NONE" },
                Whitespace = { fg = "NONE", bg = "red" }
            },
        },
        config = function(_, opts)
            require("gruvbox").setup(opts)
            vim.cmd.colorscheme("gruvbox")
        end,
    },
}
