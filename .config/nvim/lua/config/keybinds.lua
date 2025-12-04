vim.g.mapleader = " "

vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("i", "jj", "<Esc>")

-- fixed typo and added sane options
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })


-- Create a new empty buffer in a vertical/horizontal split
vim.keymap.set("n", "<leader>sv", ":botright vnew<CR>", opts) -- vertical split with a new buffer
vim.keymap.set("n", "<leader>sh", ":new<CR>", opts)           -- horizontal split with a new buffer
vim.keymap.set("n", "<leader>se", "<C-w>=", { noremap = true, silent = true, desc = "Equalizar splits" })
vim.keymap.set("n", "<leader>sx", ":close<CR>", { noremap = true, silent = true, desc = "Fechar split" })

-- Force new splits to open on the right and below
vim.opt.splitright = true -- vertical splits open to the right
vim.opt.splitbelow = true -- horizontal splits open below

-- Resize splits (move borders)
vim.keymap.set("n", "<leader>+", ":resize +5<CR>", { noremap = true, silent = true, desc = "Aumentar altura" })
vim.keymap.set("n", "<leader>-", ":resize -5<CR>", { noremap = true, silent = true, desc = "Diminuir altura" })
vim.keymap.set("n", "<leader><", ":vertical resize +5<CR>", { noremap = true, silent = true, desc = "Aumentar largura" })
vim.keymap.set("n", "<leader>>", ":vertical resize -5<CR>", { noremap = true, silent = true, desc = "Diminuir largura" })

-- Window navigation with Ctrl + h/j/k/l
-- vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
-- vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
-- vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
-- vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Buffer navigation and management
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", opts)     -- next buffer
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", opts) -- previous buffer
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", opts)   -- close current buffer
vim.keymap.set("n", "<leader>bl", ":ls<CR>", opts)        -- list buffers

-- quick NvimTree resize presets
vim.keymap.set("n", "<leader>tr", ":NvimTreeResize 45<CR>", opts) -- reset/large
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

-- Toggle comments without plugins, based on 'commentstring'
local function comment_tokens()
  local cs = vim.bo.commentstring
  if not cs or cs == "" then cs = "// %s" end
  local pre, post = cs:match("^(.*)%%s(.*)$")
  pre, post = pre or "", post or ""
  return pre, post
end

local function toggle_line_comment(line)
  local pre, post = comment_tokens()
  local indent = line:match("^(%s*)") or ""
  local rest = line:sub(#indent + 1)

  local function esc(s) return vim.pesc(s or "") end

  if post == "" then
    local pat = "^" .. esc(pre) .. "%s?"
    if rest:find(pat) then
      rest = rest:gsub(pat, "", 1)
    else
      rest = pre .. rest
    end
  else
    local pat_pre = "^" .. esc(pre)
    local pat_post = esc(post) .. "$"
    if rest:find(pat_pre) and rest:find(pat_post) then
      rest = rest:gsub(pat_pre, "", 1):gsub(pat_post, "", 1)
      rest = rest:gsub("^%s+", ""):gsub("%s+$", "")
    else
      rest = pre .. rest .. post
    end
  end

  return indent .. rest
end

local function toggle_comment_current_line()
  local row = vim.api.nvim_win_get_cursor(0)[1] - 1
  local line = vim.api.nvim_buf_get_lines(0, row, row + 1, false)[1] or ""
  vim.api.nvim_buf_set_lines(0, row, row + 1, false, { toggle_line_comment(line) })
end

local function toggle_comment_visual()
  local start_row = vim.fn.getpos("v")[2] - 1
  local end_row = vim.api.nvim_win_get_cursor(0)[1] - 1
  if start_row > end_row then start_row, end_row = end_row, start_row end
  local lines = vim.api.nvim_buf_get_lines(0, start_row, end_row + 1, false)
  for i, line in ipairs(lines) do
    lines[i] = toggle_line_comment(line)
  end
  vim.api.nvim_buf_set_lines(0, start_row, end_row + 1, false, lines)
end

-- Keymaps: <leader>/ to toggle comment
vim.keymap.set("n", "<leader>/", toggle_comment_current_line, { noremap = true, silent = true })
vim.keymap.set("v", "<leader>/", toggle_comment_visual, { noremap = true, silent = true })
