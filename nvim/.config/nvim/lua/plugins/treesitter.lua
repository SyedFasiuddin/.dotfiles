return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    opts = {
        highlight = {
            enable = true,
            disable = function(lang, buf)
                local max_filesize = 50 * 1024 -- 50 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
            disable = { "ledger" },
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        auto_install = true,
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
