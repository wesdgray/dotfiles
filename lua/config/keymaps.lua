-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

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
TERM_PATH = "C:\\Program Files\\PowerShell\\7\\pwsh.exe"
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
