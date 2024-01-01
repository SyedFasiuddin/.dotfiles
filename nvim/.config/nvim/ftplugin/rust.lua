vim.opt_local.colorcolumn = "99"

vim.api.nvim_set_keymap("n", "<F3>", "<Cmd>!cargo fmt<CR>",
    { noremap = true, silent = true })

-- To be able to use `:make'
if vim.fn.filereadable("Cargo.toml") == 1 then
    vim.g.cargo_makeprg_params = "check"
    vim.cmd.compiler("cargo")
else
    vim.cmd.compiler("rustc")
end
