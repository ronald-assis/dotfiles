-- Dracula
--local colorscheme = "dracula"

-- Cobalt
--local colorscheme = "cobalt"

-- Night Owl
local colorscheme = "night-owl"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
