local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    print("Failed to load lualine!!!")
    return
end

lualine.setup {
    options = {
        icons_enabled = true,
        theme = "gruvbox-baby",
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            "mode"
    --        { 'mode', fmt = function(str) return str:sub(1,2) end },
        },
        lualine_b = {"filename"},
        lualine_c = {'diff', 'diagnostics'},
        lualine_x = {"encoding", "fileformat"},
        lualine_y = {},
        lualine_z = {"filesize"},
    },
    tabline = {
        lualine_a = {"location", "progress"},
        lualine_z = {"tabs"},
    },
    refresh = {
        statusline = 500,
        tabline = 500,
        winbar = 500
    }
}

vim.opt.showtabline = 1     -- this is exactly what I wanted. showing the tabline when I have more then one tab open otherwise not showing it!!!

