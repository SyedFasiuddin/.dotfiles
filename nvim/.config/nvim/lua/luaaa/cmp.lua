local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
    print("Unable to load cmp")
    return
end

local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
    print("Unable to load luasnip")
    return
end

require("luasnip/loaders/from_vscode").lazy_load()

vim.cmd[[set completeopt=menu,menuone,noselect]]
vim.cmd[[set pumheight=8]]

cmp.setup {
    snippet = {
    	expand = function(args)
      		luasnip.lsp_expand(args.body)
    	end,
  	},
	sources = {
        {name = "nvim_lsp"},
		{name = "luasnip"},
        {name = "buffer"},
    },
    mapping = {
    -- Default are C-n and C-p of vim and nvim, which are enabled in telescope as well,
    -- so to keep it consistent, removing these and using them.
--         ["<"] = cmp.mapping.select_prev_item(),
--         [">"] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm({select = false}),
        ["<C-Space>"] = cmp.mapping.complete(),     -- bring up completion menu
        ["<C-e>"] = cmp.mapping.abort(),            -- close completion menu
    },
	confirm_opts = {
    	behavior = cmp.ConfirmBehavior.Replace,
    	select = false,
  	},
  	window = {
        documentation = {
     		winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
      	},
 	    completion = {
      		winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
	    },
  	},
  	experimental = {
        native_menu = false,
    	ghost_text = false,
  	},
    view = {
        entries = {
            name = "custom",
        }
    }
}

