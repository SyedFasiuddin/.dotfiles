local lsp_ok, lspconfig = pcall(require, "lspconfig")
if not lsp_ok then
    print("Failed to load lspconfig!!!")
    return
end

local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not mason_lsp_ok then
    print("Failed to load mason-lspconfig.nvim!!!")
    return
else
    mason_lsp.setup()
end

local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_ok then
    print("Failed to load cmp_nvim_lsp")
    return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

local on_attach = function(_, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<Leader>c", vim.lsp.buf.code_action, bufopts)

    vim.keymap.set("n", "<F3>", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)
end

local servers = {
    "tsserver",
    "pyright",
    "texlab",
    "clangd",
    "bashls",
    "rust_analyzer",
    "lua_ls",
}

for _, value in pairs(servers) do
    lspconfig[value].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
});
