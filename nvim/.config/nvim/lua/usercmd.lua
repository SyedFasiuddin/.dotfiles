vim.api.nvim_create_user_command("Tectonic", function(opts)
    local args = opts.args or ""
    local fd = io.open("Tectonic.toml", "r")
    if fd ~= nil then
        io.close(fd)
        print(vim.fn.system("tectonic -X build " .. args))
    else
       vim.notify("'Tectonic.toml' does not exist in this directory",
            vim.log.levels.ERROR)
    end
end, { nargs = "?" })
