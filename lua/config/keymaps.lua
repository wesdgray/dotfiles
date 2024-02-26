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

map("n", "<leader>bl", "<cmd>BufferLineMoveNext<CR>")
map("n", "<leader>bh", "<cmd>BufferLineMovePrev<CR>")
map("n", "L", "<cmd>BufferLineCycleNext<CR>")
map("n", "H", "<cmd>BufferLineCyclePrev<CR>")

map("n", "-", "<cmd>Oil --float<cr>")
