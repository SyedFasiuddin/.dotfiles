local status, telescope = pcall(require, "telescope")
if not status then
    print("Failed to load Telescope")
    return
end

local _, actions = pcall(require, "telescope.actions")
local _, builtin = pcall(require, "telescope.builtin")
-- not checking if these return ok since they will be loaded on first
-- load of telescope above and then they will use same reference table

-- local function telescope_buffer_dir()
--     return vim.fn.expand('%:p:h')
-- end

local fb_actions = telescope.extensions.file_browser.actions

telescope.setup({
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close
            },
        },
    },

    extensions = {
        file_browser = {
            theme = "dropdown",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                -- your custom insert mode mappings
                -- ["i"] = {
                --     ["<C-w>"] = function() vim.cmd('normal vbd') end,
                -- },
                ["n"] = {
                    -- netrw like bindings
                    ["%"] = fb_actions.create,
                    ["<S-r>"] = fb_actions.rename,
                    ["<S-d>"] = fb_actions.remove,
                    -- ["h"] = fb_actions.goto_parent_dir,
                    -- ["/"] = function()
                    --     vim.cmd('startinsert')
                    -- end
                },
            },
        },
    },
})

telescope.load_extension("file_browser")

vim.keymap.set('n', ';f',
    function()
        builtin.find_files({
            file_ignore_patterns = {
                ".git",
                "node_modules",
            },
            no_ignore = false,
            hidden = true
        })
    end
)

vim.keymap.set("n", ";e",
    function()
        telescope.extensions.file_browser.file_browser({
            -- path = "%:p:h",
            -- cwd = telescope_buffer_dir(),
            -- respect_gitignore = false,
            file_ignore_patterns = {
                ".git",
                "node_modules",
            },
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 25 }
        })
    end
)

vim.keymap.set('n', ';r', function() builtin.live_grep() end)
vim.keymap.set('n', ';t', function() builtin.help_tags() end)
vim.keymap.set('n', ';;', function() builtin.resume() end)
vim.keymap.set('n', ';d', function() builtin.diagnostics() end)

vim.keymap.set('n', ';b',
    function()
        builtin.buffers({
            initial_mode = "normal"
        })
    end
)

