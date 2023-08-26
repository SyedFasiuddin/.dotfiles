return {
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim"
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                mappings = {
                    n = {
                        ["q"] = actions.close
                    },
                },
            },
        })

        vim.keymap.set("n", "<Leader>f",
            function()
                builtin.find_files({
                    file_ignore_patterns = {
                        ".git/",
                        "node_modules/",
                        "dist/",
                    },
                    no_ignore = false,
                    hidden = true,
                })
            end, { desc = "Telescope: Open [f]ile picker" }
        )

        vim.keymap.set("n", "<Leader>g",
            function()
                builtin.live_grep({
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
            end, { desc = "Telescope: [g]rep search" }
        )

        vim.keymap.set("n", "<Leader>t",
            function()
                builtin.help_tags()
            end, { desc = "Telescope: Open help [t]ags" }
        )

        vim.keymap.set("n", "<Leader>;",
            function()
                builtin.resume()
            end, { desc = "Telescope: Resume the last picker with entire state" }
        )

        vim.keymap.set("n", "<Leader>d",
            function()
                builtin.diagnostics()
            end, { desc = "Telescope: Open lsp [d]iagnostics" }
        )

        vim.keymap.set("n", "<Leader><space>", "<Cmd>Telescope<CR>", {
            desc = "Telescope: Open telescope options"
        })

        vim.keymap.set("n", "<Leader>b",
            function()
                builtin.buffers({
                    initial_mode = "normal"
                })
            end, { desc = "Telescope: List open [b]uffers" }
        )
    end
}
