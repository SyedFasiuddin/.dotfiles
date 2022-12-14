-- Shorten function name
local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

-- setting leader to space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

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

-- File explorer
-- 30 means take 30% of space
-- keymap("n", "<Leader>e", ":Lex 30<CR>", opts)

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


-----------------------------
---- Vim hard mode like  ----
-----------------------------

keymap("n", "<Up>"    , "<Nop>", opts)
keymap("n", "<Down>"  , "<Nop>", opts)
keymap("n", "<Right>" , "<Nop>", opts)
keymap("n", "<Left>"  , "<Nop>", opts)
keymap("n", "<Enter>" , "<Nop>", opts)
keymap("n", "<BS>"    , "<Nop>", opts)

keymap("v", "<Up>"    , "<Nop>", opts)
keymap("v", "<Down>"  , "<Nop>", opts)
keymap("v", "<Right>" , "<Nop>", opts)
keymap("v", "<Left>"  , "<Nop>", opts)
keymap("v", "<Enter>" , "<Nop>", opts)
keymap("v", "<BS>"    , "<Nop>", opts)

keymap("i", "<Up>"    , "<Nop>", opts)
keymap("i", "<Down>"  , "<Nop>", opts)
keymap("i", "<Right>" , "<Nop>", opts)
keymap("i", "<Left>"  , "<Nop>", opts)
