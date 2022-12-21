local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print("Failed to load packer!!!")
    return
end

-- to make packer use a popup window, default is vertical split
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({
                border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            })
        end,
    },
})

return packer.startup(function(use)
    -- packer manages itself
    use("wbthomason/packer.nvim")

    -- I don't know, these two are required by other plugins
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")

    use("hrsh7th/nvim-cmp") -- completion menu handler
    use("hrsh7th/cmp-buffer") -- source which gives completion from buffer
    use("L3MON4D3/LuaSnip") -- snippets engine
    -- use "saadparwaiz1/cmp_luasnip"

    use("neovim/nvim-lspconfig")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    use("hrsh7th/cmp-nvim-lsp") -- make lsp a source in cmp

    use("jose-elias-alvarez/null-ls.nvim")

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate",
    })
    use("p00f/nvim-ts-rainbow") -- bracketpaircolorizer

    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
    })

    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })

    use("tpope/vim-sleuth")

    use("mfussenegger/nvim-jdtls")

    use("SyedFasiuddin/nop.vim")

    use("theprimeagen/harpoon")

    use({
        "folke/neodev.nvim",
        config = function ()
            require("neodev").setup()
        end
    })

    -- colorschemes
    use("luisiacc/gruvbox-baby")
    use("gruvbox-community/gruvbox")
end)
