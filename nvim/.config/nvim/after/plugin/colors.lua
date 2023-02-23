
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function ()
        vim.cmd[[ hi Normal      ctermbg=NONE guibg=NONE ]]
        vim.cmd[[ hi NormalFloat ctermbg=NONE guibg=NONE ]]
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

vim.cmd[[ hi WinSeparator guifg=darkgray ]]
vim.cmd[[ hi ColouColumn guibg=darkgray ]]

-- Finally set colorscheme
vim.cmd[[ colorscheme gruvbox-baby ]]
