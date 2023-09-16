return {
    "nvim-lualine/lualine.nvim",
    event = { "LspAttach", "WinNew", "TabNew" },
    opts = {
        options = {
            icons_enabled = false,
            theme = "auto",
            section_separators = { left = "", right = "" },
            component_separators = { left = "", right = "" },
            globalstatus = true,
            refresh = {
                statusline = 500,
                tabline = 500,
                winbar = 500,
            },
        },
        sections = {
            lualine_a = {
                { "mode", fmt = function(str) return str:sub(1, 3) end },
            },
            lualine_b = {
                {
                    "diagnostics",
                    symbols = { error = "", warn = "", info = "", hint = "" },
                    always_visible = true,
                }
            },
            lualine_c = { "%f" },
            lualine_x = {
                "encoding",
                {
                    "fileformat",
                    symbols = {
                        unix = "Unix",
                        dos = "Dos",
                        mac = "Mac",
                    }
                }
            },
            lualine_y = { "diff" },
            lualine_z = { "filetype" },
        },
        tabline = {
            lualine_a = {
                {
                    "tabs",
                    mode = 1,
                    max_length = vim.o.columns,
                    tabs_color = {
                        active = "lualine_c_inactive",
                        inactive = "lualine_a_active",
                    },
                    cond = function()
                        if #vim.api.nvim_list_tabpages() > 1 then
                            vim.opt.showtabline = 1
                            return true
                        else
                            vim.opt.showtabline = 0
                            return false
                        end
                    end,
                    fmt = function(name, context)
                        local buflist = vim.fn.tabpagebuflist(context.tabnr)
                        local winnr = vim.fn.tabpagewinnr(context.tabnr)
                        local bufnr = buflist[winnr]
                        local mod = vim.fn.getbufvar(bufnr, "&mod")
                        return context.tabnr .. ":" .. name .. (mod == 1 and "+" or "")
                    end
                }
            },
        },
    },
    keys = {
        {
            "<C-w>,",
            function()
                vim.ui.input({
                    prompt = "Enter new tab name: ",
                }, function(input)
                        if input then
                            vim.cmd("LualineRenameTab " .. input)
                        else
                            vim.cmd("LualineRenameTab")
                        end
                    end)
            end,
            desc = "Rename tabs",
        },
    },
}
