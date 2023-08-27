return {
    "nvim-orgmode/orgmode",
    ft = "org",
    dependencies = {
        {
            "akinsho/org-bullets.nvim",
            config = true,
        },
    },
    config = function()
        vim.opt.conceallevel = 2
        vim.opt.concealcursor = "nc"
        require("orgmode").setup_ts_grammar()
        require("orgmode").setup({
            org_hide_emphasis_markers = true
        })
    end
}
