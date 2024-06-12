return {
    "preservim/vim-markdown",
    ft = "markdown",
    init = function()
        vim.g.markdown_folding = 1      -- vim builtin
        vim.g.vim_markdown_folding_disabled = 1
        vim.g.vim_markdown_frontmatter = 1
        vim.g.vim_markdown_new_list_item_indent = 2
    end,
}
