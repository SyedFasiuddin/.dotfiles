local lsp_ok, lspconfig = pcall(require, "lspconfig")
if not lsp_ok then
    print("Failed to load lspconfig!!!")
    return
end

-- local installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
-- if not installer_ok then
--     print("Failed to load nvim-lsp-installer!!!")
-- else
--     lsp_installer.setup()
-- end

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

    vim.keymap.set("n", "<Leader>f", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)
end

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    vim.api.nvim_get_runtime_file("", true),
                },
            },
            telemetry = { enable = false },
        },
    },
})

-- local ok, null_ls = pcall(require, "null-ls")
-- if not ok then
--     print("Failed to load null-ls")
--     return
-- end
--
-- null_ls.setup({
--     sources = {
--         null_ls.builtins.formatting.stylua,
--         -- null_ls.builtins.diagnostics.eslint,
--         -- null_ls.builtins.completion.spell,
--     },
-- })

local servers = {
    "tsserver",
    "pyright",
    "texlab",
    "clangd",
    "bashls",
    "intelephense",
    "html",
    "sqlls",
}

for _, value in pairs(servers) do
    lspconfig[value].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end
