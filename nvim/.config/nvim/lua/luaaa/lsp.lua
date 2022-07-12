local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    print("Failed to load lspconfig!!!")
    return
end


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.tsserver.setup {
    capabilities = capabilities
}
