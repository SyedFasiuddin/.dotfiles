local status_ok, mason = pcall(require, "mason")
if not status_ok then
    print("Failed to load mason.nvim!!!")
    return
end

mason.setup()
