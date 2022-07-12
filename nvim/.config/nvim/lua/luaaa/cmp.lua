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
        ["<"] = cmp.mapping.select_prev_item(),
        [">"] = cmp.mapping.select_next_item(),
--        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm {select = true},
        ["<C-c>"] = cmp.mapping.close(),
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
}

