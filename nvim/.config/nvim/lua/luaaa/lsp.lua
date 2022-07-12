local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    print("Failed to load lspconfig!!!")
    return
end

lspconfig.tsserver.setup({})
