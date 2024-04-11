-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- shorten function name
local keymap = vim.api.nvim_set_keymap

-- remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap('n', '<leader>pv', ":Ex<cr>", opts)
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>"):w

-- resize with arrows
keymap("n", "<C-Up>", ":resize +1<CR>", opts)
keymap("n", "<C-Down>", ":resize -1<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -1<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +1<CR>", opts)

-- manage windows
keymap("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", opts) -- make split window equal width
keymap("n", "<leader>sx", ":close<CR>", opts) -- close current split window
keymap("n", "<leader>sm", ":MaximizerToggle<CR>", opts) -- toggle maximization

-- manage tabs
keymap("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>", opts) -- go to next tab
keymap("n", "<leader>tp", ":tabp<CR>", opts) -- go to previous tab

-- navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- general keymaps
keymap("n", "<leader>nh", ":nohl<CR>", opts) -- clear search
keymap("n", "x", '"_x', opts) -- do not save deleted character to buffer
keymap("n", "<leader>+", "<C-a>", opts) -- increment number
keymap("n", "<leader>-", "<C-x>", opts) -- decrement number

-- Insert --
keymap('i', 'jk', '<ESC>', opts)

-- Visual --
-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- prevents yanking substituted content
keymap('v', 'p', '"_dP', opts)

-- move text up and down
keymap("v", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("v", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Visual Block --
-- move text up and down
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)

-- Terminal --
-- better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
