local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move between tabs
keymap("n", "<leader>h", ":bp<CR>", opts)
keymap("n", "<leader>l", ":bn<CR>", opts)
keymap("n", "<leader>w", ":Bdelete<CR>", opts)

-- Nvimtree
keymap("n", "<C-b>", ":NvimTreeToggle<CR>", opts)

-- Insert --
-- Press jj fast to enter
keymap("i", "jj", "<ESC>", opts)

-- Find files/live grep
keymap("n", "<C-p>", "<cmd>lua require'telescope.builtin'.find_files({layout_strategy='vertical',layout_config={width=0.5}})<cr>", opts)
keymap("n", "<C-f>", "<cmd>lua require'telescope.builtin'.live_grep({layout_strategy='vertical',layout_config={width=0.5}})<cr>", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
