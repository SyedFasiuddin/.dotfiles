-- Shorten function name
local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

-- setting leader to space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- A -- means Alt key
-- C -- means Control key
--   -- windows key
-- S -- shift key
-- <Leader> -- leader key (space)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal Mode --
-- Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Window Resize
keymap("n", "<A-h>", ":vertical resize +2<CR>", opts)
keymap("n", "<A-j>", ":resize +2<CR>", opts)
keymap("n", "<A-k>", ":resize -2<CR>", opts)
keymap("n", "<A-l>", ":vertical resize -2<CR>", opts)

-- File explorer
-- 30 means take 30% of space
keymap("n", "<Leader>e", ":Lex 30<CR>", opts)

-- Insert Mode --
-- escaping to normal mode
keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
