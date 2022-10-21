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

-----------------------------
---- Normal Mode Keymaps ----
-----------------------------

-- Window Navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Window Resize
-- keymap("n", "<A-h>", ":vertical resize +2<CR>", opts)
-- keymap("n", "<A-j>", ":resize +2<CR>", opts)
-- keymap("n", "<A-k>", ":resize -2<CR>", opts)
-- keymap("n", "<A-l>", ":vertical resize -2<CR>", opts)
-- on MacOS there is no Alt key, and I don't want to find a work around
keymap("n", "<C-h>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-j>", ":resize -2<CR>", opts)
keymap("n", "<C-k>", ":resize +2<CR>", opts)
keymap("n", "<C-l>", ":vertical resize -2<CR>", opts)

-- Don't use arrow keys
keymap("n", "<Up>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)
keymap("n", "<Right>", "<Nop>", opts)
keymap("n", "<Left>", "<Nop>", opts)

keymap("n", "<Enter>", "<Nop>", opts)
keymap("n", "<BS>", "<Nop>", opts)

-- File explorer
-- 30 means take 30% of space
-- keymap("n", "<Leader>e", ":Lex 30<CR>", opts)

-----------------------------
---- Insert Mode Keymaps ----
-----------------------------

-- escaping to normal mode
keymap("i", "jj", "<ESC>", opts)
-- NOTE: <C-c> can also be used

-- -- Don't use arrow keys
-- -- default: backspace
-- keymap("i", "<C-h>", "<Nop>", opts)
-- keymap("i", "<C-h>", "<Left>", opts)
-- keymap("i", "<Left>", "<Nop>", opts)
--
-- -- default: insert newline character <NL>
-- keymap("i", "<C-j>", "<Nop>", opts)
-- keymap("i", "<C-j>", "<Down>", opts)
-- keymap("i", "<Down>", "<Nop>", opts)
--
-- -- default: I did't understand, :h i_CTRL-K
-- keymap("i", "<C-k>", "<Nop>", opts)
-- keymap("i", "<C-k>", "<Up>", opts)
-- keymap("i", "<Up>", "<Nop>", opts)
--
-- -- default: I didn't understand, :h i_CTRL-L
-- keymap("i", "<C-l>", "<Nop>", opts)
-- keymap("i", "<C-l>", "<Right>", opts)
-- keymap("i", "<Right>", "<Nop>", opts)

-----------------------------
---- Visual Mode Keymaps ----
-----------------------------

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Don't use arrow keys
keymap("v", "<Up>", "<Nop>", opts)
keymap("v", "<Down>", "<Nop>", opts)
keymap("v", "<Right>", "<Nop>", opts)
keymap("v", "<Left>", "<Nop>", opts)

keymap("v", "<Enter>", "<Nop>", opts)
keymap("v", "<BS>", "<Nop>", opts)
