local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    print("Failed to load lspconfig!!!")
    return
end

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    print("Failed to load nvim-lsp-installer!!!")
    return
end

lsp_installer.setup()

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

-- local status_ok, cmp_nvim = pcall(require, "cmp_nvim_lsp")
-- if not status_ok then
--     print("Failed to load cmp_nvim_lsp!!!")
--     return
-- end

local capabilities = require("cmp_nvim_lsp").update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

lspconfig.tsserver.setup {
    capabilities = capabilities,
    on_attach = keymaps,
}

lspconfig.sumneko_lua.setup({
    on_attach = keymaps,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files 
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
            },
        },
    },
})

lspconfig.pyright.setup({
    on_attach = keymaps,
    capabilities = capabilities,
})

local ok, null_ls = pcall(require, "null-ls")
if not ok then
    print("Failed to load null-ls")
    return
end

null_ls.setup({
    sources = {
       null_ls.builtins.formatting.stylua,
       null_ls.builtins.diagnostics.eslint,
       null_ls.builtins.completion.spell,
    },
    on_attach = keymaps,
})

lspconfig.texlab.setup({
    on_attach = keymaps,
    capabilities = capabilities,
})
