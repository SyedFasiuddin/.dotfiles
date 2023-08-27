return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    opts = {
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = false },
        ensure_installed = { "c", "lua", "javascript", "python" },
        auto_install = true,
        rainbow = {
            enable = true,
            extended_mode = true,
        },
    },
}
