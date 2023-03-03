vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.cmd [[ hi Normal      ctermbg=NONE guibg=NONE ]]
        vim.cmd [[ hi NormalFloat ctermbg=NONE guibg=NONE ]]
    end
})

-- morhetz/gruvbox
vim.g.gruvbox_contrast_dark = "hard"

-- luisiacc/gruvbox-baby
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
}

-- navarasu/onedark.nvim
require("onedark").setup({
    style = "darker",
    ending_tildes = true,
    code_style = {
        comments = "NONE",
    },
    highlights = {
        WinSeparator = { fg = "#E0E0E0", bg = "NONE",    style = "NONE" },
    },
})

local set_colorscheme = function(colo)
    if colo ~= "" then
        vim.cmd.colorscheme(colo)
        return
    end

    local file_path = string.format("%s/colorscheme", vim.fn.stdpath("data"))
    local fp = io.open(file_path)
    if not fp then
        print("Cannot read colorscheme file!!!")
        return
    end

    -- file is supposed to be of type:
    -- line 1: name of colorscheme
    -- line 2: background mode
    local colorscheme = fp:read("*l")
    local bg_mode = fp:read("*l")
    fp:close()

    vim.opt.background = bg_mode
    vim.cmd.colorscheme(colorscheme)
end

vim.api.nvim_create_user_command("ChangeColorScheme", function(opts)
    set_colorscheme(opts.args)
end, { nargs = "?" })

-- Finally set colorscheme
set_colorscheme("")
