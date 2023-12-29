return {
    "folke/zen-mode.nvim",
    dependencies = {
        {
            "folke/twilight.nvim",
            opts = {
                dimming = {
                    alpha = 0.25,
                },
            }
        }
    },
    opts = {
        window = {
            backdrop = 1,
            width = 82,
            height = .50,
            options = {
                number = false,
                relativenumber = false,
            }
        },
    },
    keys = {
        {
            "<F2>",
            "<Cmd> ZenMode <CR>",
            desc = "Toggle Zen Mode",
        },
        {
            "<F2>",
            "<ESC><Cmd> ZenMode <CR>a",
            mode = { "i" },
            desc = "Toggle Zen Mode",
        },
    },
    cmd = "ZenMode",
}
