return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },

  {
    "ThePrimeagen/harpoon",
  },

  -- Use :Telescope notify if a notification is missed.
  {
    "rcarriga/nvim-notify",
    opts = {
      render = "compact",
      top_down = false,
      max_height = function()
        return math.floor(vim.o.lines * 0.3)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.65)
      end,
      timeout = 5000,
    },
  },
}
