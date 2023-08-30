local sets = {
    number = true,
    relativenumber = true,

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

    numberwidth = 3,            -- number column width
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

    showmode = false,           -- ex line showing mode
    laststatus = 0,
}

for key, value in pairs(sets) do
    vim.opt[key] = value
end

for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
    vim.g["loaded_" .. provider .. "_provider"] = 0
end

vim.g.netrw_banner = 0
