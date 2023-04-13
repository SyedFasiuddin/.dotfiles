vim.opt_local.colorcolumn = "99"

vim.api.nvim_set_keymap("n", "<F3>", "<Cmd>!cargo fmt",
    { noremap = true, silent = true })
