-- Maintainer: Syed Fasiuddin <syedfasiuddin.02@gmail.com>
--
-- If a file represents a project type then detect it and set common
-- configuration options for that project type. Do an early return as there
-- will be only one project configuration needed at a time.
--
-- if vim.fn.filereadable("") == 1 then
--     return
-- end

-- Rust project
if vim.fn.filereadable("Cargo.toml") == 1 then
    vim.g.cargo_makeprg_params = "check"
    vim.cmd.compiler("cargo")

    vim.opt.wildignore:append("*/target/*")
    vim.opt.wildignore:append("*.lock")

    return
end

-- LaTeX project
if vim.fn.filereadable("Tectonic.toml") == 1 then
    vim.g.tectonic_v2_interface = 1
    vim.cmd.compiler("tectonic")

    vim.opt.wildignore:append("*/build/*")

    return
end

-- Maven project
if vim.fn.filereadable("pom.xml") == 1 then
    vim.opt.wildignore:append("*/target/*")
    vim.opt.wildignore:append("*/.settings/*")
    vim.opt.wildignore:append("*/.idea/*")
    vim.opt.wildignore:append(".classpath")
    vim.opt.wildignore:append(".project")

    return
end
