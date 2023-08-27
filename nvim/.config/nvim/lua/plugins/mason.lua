return {
    "williamboman/mason.nvim",
    cmd = {
        "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall",
        "MasonUninstallAll", "MasonLog"
    },
    opts = {
        ui = {
            -- border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                -- package_uninstalled = "✗",
            },
        },
    }
}
