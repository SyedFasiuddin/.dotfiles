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

telescope.setup({
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close
            },
        },
    },
})

vim.keymap.set('n', '<Leader>f',
    function()
        builtin.find_files({
            file_ignore_patterns = {
                ".git",
                "node_modules",
            },
            no_ignore = false,
            hidden = true,
        })
    end
)

vim.keymap.set('n', '<Leader>g',
    function()
        builtin.live_grep({
            additional_args = function()
                return { "--hidden" }
            end,
            file_ignore_patterns = {
                ".git",
                "node_modules",
                "*-lock.*",
            },
        })
    end
)

vim.keymap.set('n', '<Leader>t', function() builtin.help_tags() end)
vim.keymap.set('n', '<Leader>;', function() builtin.resume() end)
vim.keymap.set('n', '<Leader>d', function() builtin.diagnostics() end)

vim.keymap.set('n', '<Leader>b',
    function()
        builtin.buffers({
            initial_mode = "normal"
        })
    end
)
