return {
    "theprimeagen/harpoon",
    keys = {
        {
            "<Leader>a",
            function()
                require("harpoon.mark").add_file()
            end,
            { desc = "Harpoon: [A]dd" }
        },
        {
            "<Leader>w",
            function()
                require("harpoon.ui").toggle_quick_menu()
            end,
            { desc = "Harpoon: Vie[w]" }
        },
        {
            "<Leader>h",
            function()
                require("harpoon.ui").nav_file(1)
            end,
            { desc = "Harpoon: File [1]" }
        },
        {
            "<Leader>j",
            function()
                require("harpoon.ui").nav_file(2)
            end,
            { desc = "Harpoon: File [2]" }
        },
        {
            "<Leader>k",
            function()
                require("harpoon.ui").nav_file(3)
            end,
            { desc = "Harpoon: File [3]" }
        },
        {
            "<Leader>l",
            function()
                require("harpoon.ui").nav_file(4)
            end,
            { desc = "Harpoon: File [4]" }
        },
    },
}
