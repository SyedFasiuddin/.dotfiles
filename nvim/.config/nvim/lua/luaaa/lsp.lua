local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    print("Failed to load lspconfig!!!")
    return
end

local keymaps = function()
    -- 3rd parameter is passing reference to the function, we are not calling it
    -- the function is called when the given key is pressed in given mode
    -- buffer = 0 means what ever current buffer is
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
    vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, {buffer = 0})
    vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer = 0})
    vim.keymap.set("n", "<C-n>", vim.diagnostic.goto_next, {buffer = 0})
    vim.keymap.set("n", "<C-p>", vim.diagnostic.goto_prev, {buffer = 0})
end

-- local status_ok, capabilities = pcall(require, "cmp_nvim_lsp")
-- if not status_ok then
--    print("Failed to load cmp_nvim_lsp!!!")
--    return
-- end

local capabilities = require("cmp_nvim_lsp").update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

lspconfig.tsserver.setup {
    capabilities = capabilities,
    on_attach = keymaps
}
