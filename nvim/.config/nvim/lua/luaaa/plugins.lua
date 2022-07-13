local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print("Failed to load packer!!!")
    return
end

-- to make packer use a popup window, default is vertical split
-- and the border option is set to empty string so as to not have border
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {border = ""}
        end
    }
}

return packer.startup(function()
    -- packer manages itself
    use "wbthomason/packer.nvim"

    -- I don't know, these two are required by other plugins
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"

    -- completion menu
    use "hrsh7th/nvim-cmp"      -- completion core -> popup, snippets etc
    use "hrsh7th/cmp-buffer"    -- source which gives completion from buffer
    use "L3MON4D3/LuaSnip"      -- the thing which enable the snippets from lsp to work/expand properly
    use "saadparwaiz1/cmp_luasnip"

    -- lsp
    use "neovim/nvim-lspconfig" -- lsp core -> has configs to make built in lsp client to work
    use "williamboman/nvim-lsp-installer" -- makes it easy to install language servers

    -- combine lsp and cmp
    use "hrsh7th/cmp-nvim-lsp"  -- thing that enables cmp to tell the language server that it can show completions and requests it to send em 

    -- treesitter
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use "p00f/nvim-ts-rainbow"

    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }

    -- colorschemes
    use "luisiacc/gruvbox-baby"
    use "gruvbox-community/gruvbox"
    use "folke/tokyonight.nvim"
end)
