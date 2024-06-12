return {
    "ledger/vim-ledger",
    ft = "ledger",
    init = function()
        vim.g.ledger_detailed_first = 1
        vim.g.ledger_fillstring = "."
        vim.g.ledger_fold_blanks = 1
        vim.g.ledger_maxwidth = 80
    end,
}
