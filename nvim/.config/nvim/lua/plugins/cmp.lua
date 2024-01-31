return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "uga-rosa/cmp-dictionary",
        {
            "L3MON4D3/LuaSnip",
            config = function()
                require("luasnip").config.setup()
                require("luasnip/loaders/from_vscode").lazy_load()
            end,
            dependencies = {
                "saadparwaiz1/cmp_luasnip",
                "rafamadriz/friendly-snippets",
            },
        },
    },
    opts = function(_, opts)
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        opts.snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        }
        opts.sources = {
            { name = "nvim_lsp" },
            { name = "luasnip" },
            {
                name = "buffer",
                keyword_length = 5,
                option = {
                    get_bufnrs = function()
                        return vim.api.nvim_list_bufs()
                    end
                }
            },
            {
                name = "dictionary",
                keyword_length = 5,
            },
        }
        opts.mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<CR>"] = cmp.mapping.confirm({ select = false }),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<C-n>"] = cmp.mapping(
                function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            ["<C-p>"] = cmp.mapping(
                function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
        })
        opts.confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        }
        opts.window = {
            -- completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        }
        -- opts.experimental = {
        --     native_menu = false,
        --     ghost_text = false,
        -- }
        -- opts.view = {
        --     entries = {
        --         name = "custom",
        --     }
        -- }
        opts.formatting = {
            format = function(entry, vim_item)
                vim_item.abbr = string.sub(vim_item.abbr, 1, 50)
                vim_item.menu = ({
                    buffer = "B",
                    nvim_lsp = "L",
                    luasnip = "S",
                    dictionary = "D",
                    obsidian = "N",
                })[entry.source.name]
                return vim_item
            end,
        }
    end
}
