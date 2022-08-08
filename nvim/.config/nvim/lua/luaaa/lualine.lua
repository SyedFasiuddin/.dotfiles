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
        lualine_b = {'diff', 'diagnostics'},
        lualine_c = {},
        lualine_x = {"encoding", "fileformat"},
        lualine_y = {},
        lualine_z = {"filesize"},
    },
    tabline = {
        lualine_a = {"filename"},
        lualine_z = {"tabs"},
    },
}

