return {
    dir = "~/Developer/Lua/org-roam.nvim",
    dependencies = { "kkharji/sqlite.lua" },
    opts = {
        org_roam_directory = "~/Documents/Zettelkasten",
        org_roam_database_file = "~/.config/emacs/org-roam.db"
    },
    keys = {
        {
            "<Leader>nf",
            "<Cmd>lua require(\"org-roam\").org_roam_node_find()<CR>",
        },
        {
            "<Leader>nc",
            "<Cmd>lua require(\"org-roam\").org_roam_capture()<CR>",
        },
    },
}
