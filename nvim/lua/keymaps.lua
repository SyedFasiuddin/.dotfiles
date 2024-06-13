local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- A -- Alt/Option key
-- C -- Control key
-- S -- Shift key
-- <Leader> -- leader key (space)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-----------------------------
---- Normal Mode Keymaps ----
-----------------------------

-- File explorer
keymap("n", "<Leader>v", "<Cmd>Ex<CR>", opts)

-- LSP Diagnostics
keymap("n", "<space>e", vim.diagnostic.open_float, opts)
keymap("n", "<space>q", vim.diagnostic.setloclist, opts)
keymap("n", "[d", vim.diagnostic.goto_prev, opts)
keymap("n", "]d", vim.diagnostic.goto_next, opts)

-- Quickfix list
keymap("n", "[q", ":cp<CR>", opts)
keymap("n", "]q", ":cn<CR>", opts)

keymap("n", "<F1>", "", opts)

-----------------------------
---- Visual Mode Keymaps ----
-----------------------------

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
