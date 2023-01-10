local ok, jdtls = pcall(require, "jdtls")
if not ok then
    print("jdtls failed to load")
    return
end

local root_markers = { "gradlew", ".git", ".gradlew", "mvnw" }
local root_dir = jdtls.setup.find_root(root_markers)
local home = os.getenv("HOME")

local config = {}

config.cmd = {
    "java",

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",

    "-jar",
    home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",

    "-configuration",
    home .. "/.local/share/nvim/mason/packages/jdtls/config_mac",

    "-data",
    home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t"),
}

config.on_attach = function(_, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<Leader>c", vim.lsp.buf.code_action, bufopts)

    vim.keymap.set("n", "crv", jdtls.extract_variable, bufopts)
    vim.keymap.set("n", "crc", jdtls.extract_constant, bufopts)
    vim.keymap.set("n", "crm", jdtls.extract_method, bufopts)

    vim.keymap.set("n", "<F3>", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)
end

jdtls.start_or_attach(config)
