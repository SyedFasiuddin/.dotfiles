local sets = {
    errorbells = false,

    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,           -- convert tabs to space

    smartindent = true,
    autoindent = true,

    cursorline = true,
    colorcolumn = "80",

    guicursor = "",             -- block shaped cursor in insert modw
    termguicolors = true,

    signcolumn = "no",          -- glyph column in margin
    wrap = true,

    splitbelow = true,
    splitright = true,

    backup = false,
    swapfile = false,
    fileencoding = "utf-8",

    timeoutlen = 200,           -- wait only for these many milisec for mapped sequence to complete

    completeopt = { "menu", "menuone", "noselect" },
    pumheight = 8,
    laststatus = 0,

    list = true,
    listchars = "tab:>-,trail: ,nbsp:+",
}

for key, value in pairs(sets) do
    vim.opt[key] = value
end

for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
    vim.g["loaded_" .. provider .. "_provider"] = 0
end

vim.g.netrw_banner = 0
vim.g.tex_flavor = "latex"

vim.opt.path:append("**")
