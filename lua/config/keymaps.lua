-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

-- Stolen from keymaps.lua within lazyvim repo
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Update floating terminal to use powershell instead of cmd
if vim.loop.os_uname().sysname == "Linux" then
  TERM_PATH = "/usr/bin/bash"
else
  TERM_PATH = "C:\\Program Files\\PowerShell\\7\\pwsh.exe"
end
local lazyterm = function()
  vim.print("opening term")
  Util.float_term(TERM_PATH, { cwd = Util.get_root() })
end
map("n", "<leader>ft", lazyterm, { desc = "Terminal (root dir)" })
map("n", "<leader>fT", function()
  Util.float_term(TERM_PATH)
end, { desc = "Terminal (cwd)" })
-- C-/ is bound using C-_ in neovim on windows ._.
map("n", "<c-/>", lazyterm, { desc = "Terminal (root dir)" })
map("n", "<c-_>", lazyterm, { desc = "Terminal (root dir)" })

map("n", "<leader>ha", function()
  harpoon_mark.add_file()
end, { desc = "Harpoon - Add file" })
map("n", "<leader>hq", function()
  harpoon_ui.toggle_quick_menu()
end, { desc = "Harpoon - Quick menu" })
map("n", "<leader>hn", function()
  harpoon_ui.nav_next()
end, { desc = "Harpoon - Next" })
map("n", "<leader>hN", function()
  harpoon_ui.nav_prev()
end, { desc = "Harpoon - Previous" })
map("n", "<leader>h1", function()
  harpoon_ui.nav_file(1)
end, { desc = "Harpoon - File 1" })
map("n", "<leader>h2", function()
  harpoon_ui.nav_file(2)
end, { desc = "Harpoon - File 2" })
map("n", "<leader>h3", function()
  harpoon_ui.nav_file(3)
end, { desc = "Harpoon - File 3" })
