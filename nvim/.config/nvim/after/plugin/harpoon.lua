local mark_ok, mark = pcall(require, "harpoon.mark")
if not mark_ok then
    print("Failed to load Harpoon marks")
    return
end

local ui_ok, ui = pcall(require, "harpoon.ui")
if not ui_ok then
    print("Failed to load Harpoon ui")
    return
end

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
