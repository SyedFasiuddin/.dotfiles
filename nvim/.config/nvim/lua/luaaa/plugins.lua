local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print("Failed to load packer!!!")
    return
end

-- to make packer use a popup window
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


    -- pop API
    use "nvim-lua/popup.nvim"

    -- colorschemes
    use "luisiacc/gruvbox-baby"
    use "gruvbox-community/gruvbox"
    use "folke/tokyonight.nvim"
end)
