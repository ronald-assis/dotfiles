vim.g.mapleader = " "

vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("i", "jj", "<Esc>")

-- fixed typo and added sane options
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })


-- Create a new empty buffer in a vertical/horizontal split
vim.keymap.set("n", "<leader>sv", ":vnew<CR>", opts) -- vertical split with a new buffer
vim.keymap.set("n", "<leader>sh", ":new<CR>", opts)  -- horizontal split with a new buffer

-- Window navigation with Ctrl + h/j/k/l
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Buffer navigation and management
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", opts)     -- next buffer
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", opts) -- previous buffer
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", opts)   -- close current buffer
vim.keymap.set("n", "<leader>bl", ":ls<CR>", opts)        -- list buffers

-- quick NvimTree resize presets
--vim.keymap.set("n", "<leader>tr", ":NvimTreeResize 45<CR>", opts) -- reset/large
vim.keymap.set("n", "<leader>tn", ":NvimTreeResize 30<CR>", opts) -- reset/large

vim.keymap.set("n", "<leader>tr", function()
  vim.ui.input({ prompt = "NvimTree width (number): " }, function(input)
    local n = tonumber(input)
    if n and n > 0 then
      vim.cmd("NvimTreeResize " .. n)
      vim.notify("NvimTree resized to " .. n, vim.log.levels.INFO)
    else
      vim.notify("Invalid width", vim.log.levels.ERROR)
    end
  end)
end, opts)
