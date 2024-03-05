return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    opts = {
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        auto_install = true,
        rainbow = {
            enable = true,
            extended_mode = true,
        },
    },
    config = function (_, opts)
        require("nvim-treesitter.configs").setup(opts)
        vim.cmd [[
            set foldmethod=expr
            set foldexpr=nvim_treesitter#foldexpr()
            set nofoldenable
        ]]
    end,
}
