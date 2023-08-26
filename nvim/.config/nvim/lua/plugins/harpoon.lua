return {
    "theprimeagen/harpoon",
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<Leader>a", mark.add_file, { desc = "Harpoon: [A]dd" })
        vim.keymap.set("n", "<Leader>w", ui.toggle_quick_menu,
        { desc = "Harpoon: Vie[w]" })

        local function set_harpoon_keys(opts)
            for key, num in pairs(opts) do
                vim.keymap.set("n", "<Leader>" .. key, function()
                    ui.nav_file(num)
                end, { desc = "Harpoon: File [" .. num .. "]" })
            end
        end

        set_harpoon_keys({
            ["h"] = 1,
            ["j"] = 2,
            ["k"] = 3,
            ["l"] = 4,
        })
    end
}
