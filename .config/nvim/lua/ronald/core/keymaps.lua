vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("i", "jj", "<Esc>")

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })                   -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })                 -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })                    -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })               -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

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
