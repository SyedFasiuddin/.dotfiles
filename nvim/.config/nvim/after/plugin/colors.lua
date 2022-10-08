local colorscheme = "gruvbox-baby"
local status_ok = true


-- To make background transparent with any color
-- https://www.reddit.com/r/neovim/comments/3v06lo/comment/cxj6e4q/?utm_source=share&utm_medium=web2x&context=3
status_ok, _ = pcall(vim.cmd, "au ColorScheme * hi Normal ctermbg=none guibg=none")
-- local status_ok, _ = pcall(vim.cmd, "au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red")
if not status_ok then
    print("Transparent background setup failed")
    return
end

-- gruvbox related
vim.g.gruvbox_contrast_dark = 'hard'

-- vim.opt.background = "dark"

-- gruvbox-baby related
vim.g.gruvbox_baby_background_color = "dark"
vim.g.gruvbox_baby_transparent_mode = true
vim.g.gruvbox_baby_keyword_style = "NONE"
vim.g.gruvbox_baby_function_style = "NONE"
vim.g.gruvbox_baby_comment_style = "NONE"


-- setting colorscheme here
-- options for any colorschemes should go above this
status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    print("Colorscheme " .. colorscheme .. " notfound")
    return
end

vim.cmd("hi NormalFloat guibg=None")
