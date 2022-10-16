local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    print("Failed to load treesitter!!!")
    return
end

treesitter.setup {
    ensure_installed = { "c", "lua", "javascript", "python" },
    auto_install = true,
    indent = { enable = false },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
    },
}

