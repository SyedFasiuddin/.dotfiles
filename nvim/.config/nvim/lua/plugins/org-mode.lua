return {
    {
        "nvim-orgmode/orgmode",
        config = function()
            vim.opt.conceallevel = 2
            vim.opt.concealcursor = "nc"
            require("orgmode").setup_ts_grammar()
            require("orgmode").setup({
                org_hide_emphasis_markers = true
            })
        end
    },
    {
        "akinsho/org-bullets.nvim",
        config = function()
            require("org-bullets").setup()
        end
    },
}
