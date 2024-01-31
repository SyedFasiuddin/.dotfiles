return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make"
        },
    },
    lazy = true,
    config = function()
        require("telescope").load_extension("fzf")
    end,
    cmd = "Telescope",
    keys = {
        {
            "<Leader><space>",
            "<Cmd> Telescope <CR>",
            { desc = "Telescope: Open telescope options" }
        },
        {
            "<Leader>f",
            function()
                require("telescope.builtin").find_files({
                    file_ignore_patterns = {
                        ".git/",
                        "node_modules/",
                        "dist/",
                    },
                    no_ignore = false,
                    hidden = true,
                })
            end,
            { desc = "Telescope: Open [f]ile picker" }
        },
        {
            "<Leader>g",
            function()
                require("telescope.builtin").live_grep({
                    additional_args = function()
                        return { "--hidden" }
                    end,
                    file_ignore_patterns = {
                        ".git/",
                        "node_modules/",
                        "dist/",
                        "*-lock.*",
                    },
                })
            end,
            { desc = "Telescope: [g]rep search" }
        },
        {
            "<Leader>d",
            "<Cmd> Telescope diagnostics <CR>",
            { desc = "Telescope: Open lsp [d]iagnostics" }
        },
        {
            "<Leader>b",
            "<Cmd> Telescope buffers <CR>",
            { desc = "Telescope: List open [b]uffers" }
        },
        {
            "<Leader>t",
            "<Cmd> Telescope help_tags <CR>",
            { desc = "Telescope: Open help [t]ags" }
        },
        {
            "<Leader>;",
            "<Cmd> Telescope resume <CR>",
            { desc = "Telescope: Resume the last picker with entire state" }
        },
    },
}
