if vim.fn.filereadable("Tectonic.toml") == 1 then
    vim.g.tectonic_v2_interface = 1
end
vim.cmd.compiler("tectonic")
