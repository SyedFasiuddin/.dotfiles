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


    -- colorschemes
    use "luisiacc/gruvbox-baby"
    use "gruvbox-community/gruvbox"
    use "folke/tokyonight.nvim"
end)
