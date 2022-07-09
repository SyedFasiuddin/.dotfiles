local colorscheme = "gruvbox"


-- To make background transparent with any color
-- https://www.reddit.com/r/neovim/comments/3v06lo/comment/cxj6e4q/?utm_source=share&utm_medium=web2x&context=3
local status_ok, _ = pcall(vim.cmd, "au ColorScheme * hi Normal ctermbg=none guibg=none")
-- local status_ok, _ = pcall(vim.cmd, "au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red")
if not status_ok then
    print("Transparent background setup failed")
    return
end


-- gruvbox related
vim.g.gruvbox_contrast_dark = 'hard'

-- vim.opt.background = "dark"

-- gruvbox-baby related
-- vim.g.gruvbox_baby_transparent_mode = 1


-- setting colorscheme here
-- options for any colorschemes should go above this
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    print("Colorscheme " .. colorscheme .. " notfound")
    return
end

