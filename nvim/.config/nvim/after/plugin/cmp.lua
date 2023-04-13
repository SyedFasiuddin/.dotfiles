local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
    print("Failed to load cmp!!!")
    return
end

local luasnip_ok, luasnip = pcall(require, "luasnip")
if not luasnip_ok then
    print("Failed to load luasnip!!!")
    return
end

luasnip.config.setup()
require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
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
    },
    mapping = cmp.mapping.preset.insert({
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
    }),
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    -- experimental = {
    --     native_menu = false,
    --     ghost_text = false,
    -- },
    -- view = {
    --     entries = {
    --         name = "custom",
    --     }
    -- },

    formatting = {
        format = function(entry, vim_item)
            vim_item.menu = ({
                buffer = "[Buf]",
                nvim_lsp = "[LSP]",
                luasnip = "[Snip]",
            })[entry.source.name]
            return vim_item
        end,
    },
})
