vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- general keymaps

keymap.set("n", "<leader>nh", ":nohl<CR>") -- clear search

keymap.set("n", "x", '"_x') -- do not save deleted character to buffer

keymap.set("n", "<leader>+", "<C-a>") -- increment number
keymap.set("n", "<leader>-", "<C-x>") -- decrement number

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split window equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
