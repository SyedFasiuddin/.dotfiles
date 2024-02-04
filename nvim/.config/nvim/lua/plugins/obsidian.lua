vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function ()
        vim.opt_local.conceallevel = 2
    end,
})

vim.keymap.set("n", "gf", function()
    if require("obsidian").util.cursor_on_markdown_link() then
        return "<Cmd> ObsidianFollowLink <CR>"
    else
        return "gf"
    end
end, { noremap = false, expr = true, desc = "Obsidian: [G]oto [F]ile or link" })

return {
    "epwalsh/obsidian.nvim",
    event = {
        "BufReadPre " .. "**/Zettelkasten/**.md",
        "BufNewFile " .. "**/Zettelkasten/**.md",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "hrsh7th/nvim-cmp",
            opts = function(_, opts)
                table.insert(opts.sources, { name = "obsidian" })
            end,
        }
    },
    opts = {
        workspaces = {
            {
                name = "Zettelkasten",
                path = "~/Documents/Zettelkasten",
            },
        },
        note_id_func = function(title)
            local suffix = ""
            if title ~= nil then
                suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                for _ = 1, 4 do
                    suffix = suffix .. string.char(math.random(65, 90))
                end
            end
            return tostring(os.time()) .. "-" .. suffix
        end,
        disable_frontmatter = true,
        ui = {
            enable = false,
        },
        templates = {
            subdir = "templates",
        },
    },
    keys = {
        {
            "<Leader>nf",
            "<Cmd> ObsidianQuickSwitch <CR>",
            desc = "Obsidian: [N]ote [F]ind",
        },
        {
            "<Leader>nc",
            "<Cmd> ObsidianNew <CR>",
            desc = "Obsidian: [N]ote [C]reate",
        },
    },
}
