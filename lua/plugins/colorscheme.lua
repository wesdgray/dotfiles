return {
  {
    "yuttie/hydrangea-vim",
  },
  {
    "bluz71/vim-moonfly-colors",
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "catppuccin/nvim",
    as = "catppuccin",
  },
  {
    "rose-pine/neovim",
    as = "rose-pine",
  },
  {
    "olivercederborg/poimandres.nvim",
    opts = function()
      require("poimandres").setup({
        bold_vert_split = false, -- use bold vertical separators
        dim_nc_background = false, -- dim 'non-current' window backgrounds
        disable_background = false, -- disable background
        disable_float_background = false, -- disable background for floats
        disable_italics = false, -- disable italics
      })
    end,
  },
  {
    "AlexvZyl/nordic.nvim",
  },
  {
    "bluz71/vim-nightfly-colors",
  },
  {
    "rockerBOO/boo-colorscheme-nvim",
  },
}
