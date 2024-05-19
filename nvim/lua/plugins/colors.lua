return {
    {
        "luisiacc/gruvbox-baby",
        lazy = false,
        init = function()
            vim.g.gruvbox_baby_background_color = "dark"
            vim.g.gruvbox_baby_transparent_mode = true
            vim.g.gruvbox_baby_keyword_style = "NONE"
            vim.g.gruvbox_baby_function_style = "NONE"
            vim.g.gruvbox_baby_comment_style = "NONE"

            vim.g.gruvbox_baby_highlights = {
                WinSeparator = { fg = "#E0E0E0", bg = "NONE",    style = "NONE" },
                ColorColumn  = { fg = "NONE",    bg = "#3C3836", style = "NONE" },
                LineNr       = { fg = "#7C6F64", bg = "NONE",    style = "NONE" },
                CursorLineNr = { fg = "#FABD2F", bg = "NONE",    style = "NONE" },
                Comment      = { fg = "#928374", bg = "NONE",    style = "NONE" },
                QuickFixLine = { fg = "NONE",    bg = "#32302F", style = "NONE" },
                Whitespace   = { fg = "NONE",    bg = "red",     style = "NONE" },
            }

            vim.opt.cursorline = true
            vim.opt.termguicolors = true
        end,
        config = function()
            vim.cmd.colorscheme("gruvbox-baby")
        end,
        priority = 1000,
    },
}
