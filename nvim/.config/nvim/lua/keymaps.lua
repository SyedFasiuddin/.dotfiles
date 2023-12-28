-- Shorten function name
local keymap = vim.api.nvim_set_keymap

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

-- Window Resize
-- keymap("n", "<A-h>", ":vertical resize +2<CR>", opts)
-- keymap("n", "<A-j>", ":resize +2<CR>", opts)
-- keymap("n", "<A-k>", ":resize -2<CR>", opts)
-- keymap("n", "<A-l>", ":vertical resize -2<CR>", opts)
-- on MacOS there is no Alt key, and I don't want to find a work around
-- keymap("n", "<C-h>", ":vertical resize +2<CR>", opts)
-- keymap("n", "<C-j>", ":resize -2<CR>", opts)
-- keymap("n", "<C-k>", ":resize +2<CR>", opts)
-- keymap("n", "<C-l>", ":vertical resize -2<CR>", opts)

-- File explorer
keymap("n", "<Leader>v", "<Cmd>Ex<CR>", opts)

-----------------------------
---- Insert Mode Keymaps ----
-----------------------------

-- escaping to normal mode
keymap("i", "jj", "<ESC>", opts)
-- NOTE: <C-c> can also be used

-----------------------------
---- Visual Mode Keymaps ----
-----------------------------

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Quickfix list
keymap("n", "[q", ":cp<CR>", opts)
keymap("n", "]q", ":cn<CR>", opts)

keymap("n", "<F1>", "", opts)
