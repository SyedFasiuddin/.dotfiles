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

    scrolloff = 8,              -- vertical
    sidescrolloff = 8,          -- horizontal

    guicursor = "",             -- block shaped cursor in insert modw
    termguicolors = true,
    background = "dark",

    numberwidth = 3,            -- number column width
    signcolumn = "no",          -- glyph column in margin
    wrap = true,

    splitbelow = true,
    splitright = true,

    backup = false,
    swapfile = false,
    fileencoding = "utf-8",

    ignorecase = true,

    timeoutlen = 200,           -- wait only for these many milisec for mapped sequence to complete

    -- completion menu, brought here from cmp.lua
    completeopt = { "menu", "menuone", "noselect" },
    pumheight = 8,

    showmode = false,           -- ex line showing mode
}

for key, value in pairs(sets) do
    vim.opt[key] = value
end

