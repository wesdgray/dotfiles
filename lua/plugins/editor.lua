LazyVim = require("lazyvim")

return {
  -- Disable annoying auto completion of ( and {
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },

  -- Disable annoying auto movement to insides and end of function args when pressing tab
  {
    "echasnovski/mini.surround",
    enabled = false,
  },

  -- Disable annoying html tag completion in html and jsx
  {
    "windwp/nvim-ts-autotag",
    enabled = false,
  },

  -- Disable annoying search change
  {
    "folke/flash.nvim",
    enabled = false,
  },

  -- Disable annoying snippet thing changing shit
  {
    "L3MON4D3/LuaSnip",
    -- stylua: ignore
    keys = {
      {
        "<tab>",
        false,
        expr = true, silent = true, mode = "i",
      },
      { "<tab>", false, mode = "s" },
      { "<s-tab>", false, mode = { "i", "s" } },
    },
  },

  -- Change to a better terminal
  {
    "akinsho/toggleterm.nvim",
    config = true,
    cmd = "ToggleTerm",
    build = ":ToggleTerm",
    keys = {
      {
        "<C-\\>",
        "<cmd>ToggleTerm<cr>",
        desc = "Toggle floating terminal",
      },
      {
        "<C-\\>",
        "<cmd>ToggleTerm<cr>",
        desc = "Toggle floating terminal",
        mode = "t",
      },
    },
    opts = {
      direction = "horizontal",
      shade_filetypes = {},
      hide_numbers = true,
      insert_mappings = true,
      start_in_insert = true,
      close_on_exit = true,
      shell = vim.loop.os_uname().sysname == "Windows_NT" and "pwsh.exe" or vim.o.shell,
    },
  },

  -- Add floating fs explorer for browsing current dir with -
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      require("oil").setup()
    end,
  },
}
