vim.o.guifont = "MonoLisa:h12"
vim.o.clipboard = "unnamedplus"
vim.o.shiftwidth = 4

-- Auto install lazy if missing
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- Setup leader for lazy and plugins after lazy is setup
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup(
  -- lazy plugins
  {
    {
      "catppuccin/nvim",
      as = "catppuccin",
      init = function()
        vim.cmd.colorscheme "catppuccin"
      end
    },
    {
      "nvim-tree/nvim-web-devicons",
    },
    {
      "stevearc/oil.nvim",
      opts = {},
      dependencies = { "nvim-tree/nvim-web-devicons" },
      keys = {
        { "-", "<CMD>Oil --float<CR>", desc = "Oil file explorer", mode = "n" }
      }
    },
    {
      "williamboman/mason.nvim", 
      config = true
    },
    {
      "williamboman/mason-lspconfig.nvim",
      config = true,
      dependencies = {
        "williamboman/mason.nvim"
      },
    },
    {
      "j-hui/fidget.nvim",
      opts = {},
    },
    -- Util functions for telescope
    {
      "nvim-lua/plenary.nvim",
    },
    {
      "nvim-telescope/telescope.nvim",
      event = "VimEnter",
      dependencies = {
        "nvim-lua/plenary.nvim", 
	    "nvim-tree/nvim-web-devicons",
      },
      keys = {
        {
          "sf", 
          function() 
            require("telescope.builtin").find_files() 
          end, 
          desc = "[S]earch [F]iles", 
          mode = "n"
        },
        {
          "sk", 
          function() 
            require("telescope.builtin").keymaps() 
          end, 
          desc = "[S]earch [K]eymaps", 
          mode = "n"
        },
        {
          "sb", 
          function() 
            require("telescope.builtin").buffers() 
          end, 
          desc = "[S]earch [B]uffers", 
          mode = "n"
        },
        {
          "sr", 
          function() 
            require("telescope.builtin").resume() 
          end, 
          desc = "[S]earch [R]esume", 
          mode = "n"
        },
        {
          "sh", 
          function() 
            require("telescope.builtin").help_tags() 
          end, 
          desc = "[S]earch [S]elp", 
          mode = "n"
        },
        {
          "sz", 
          function() 
            require("telescope.builtin").live_grep() 
          end, 
          desc = "[S]earch Ripgrep", 
          mode = "n"
        },
      }
    },
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "j-hui/fidget.nvim",
      },
      init = function()
        require("mason-lspconfig").setup_handlers({
          function (server_name)
            require("lspconfig")[server_name].setup({})
          end
        })
      end,
      keys = {
        {
          "gd", 
          function() 
            require("telescope.builtin").lsp_definitions() 
          end, 
          desc = "[G]oto [D]efinitions", 
          mode = "n"
        },
        {
          "gr", 
          function() 
            require("telescope.builtin").lsp_references() 
          end, 
          desc = "[G]oto [R]eferences", 
          mode = "n"
        },
        {
          "gi", 
          function() 
            require("telescope.builtin").lsp_implementations() 
          end, 
          desc = "[G]oto [I]mplementations", 
          mode = "n"
        },
        {
          "<leader>D", 
          function() 
            require("telescope.builtin").lsp_type_definitions() 
          end, 
          desc = "Type [D]efinition", 
          mode = "n"
        },
        {
          "<leader>ds", 
          function() 
            require("telescope.builtin").lsp_document_symbols() 
          end, 
          desc = "[D]ocument [S]ymbols", 
          mode = "n"
        },
        {
          "<leader>ws", 
          function() 
            require("telescope.builtin").lsp_dynamic_workspace_symbols() 
          end, 
          desc = "[W]orkspace [S]ymbols", 
          mode = "n"
        },
        {
          "<leader>rn", 
          function() 
            vim.lsp.buf.rename()
          end, 
          desc = "LSP [R]e[n]ame", 
          mode = "n"
        },
        {
          "<leader>ca", 
          function() 
            vim.lsp.buf.code_action()
          end, 
          desc = "LSP [C]ode [A]ction", 
          mode = "n"
        },
        {
          "K", 
          function() 
            vim.lsp.buf.hover()
          end, 
          desc = "LSP Hover Documentation", 
          mode = "n"
        },
        {
          "gD", 
          function() 
            vim.lsp.buf.declaration()
          end, 
          desc = "LSP [G]oto [D]eclaration", 
          mode = "n"
        },
      }
    },
    {
      "ThePrimeagen/harpoon",
      dependencies = {
	"nvim-lua/plenary.nvim",
      },
      keys = {
	{
	  "<leader>ha",
	  function()
	    require("harpoon.mark").add_file()
	  end,
	  desc = "[H]arpoon [A]dd",
  	},
	{
	  "<leader>hq",
	  function()
	    require("harpoon.ui").toggle_quick_menu()
	  end,
	  desc = "[H]arpoon [Q]uickmenu",
  	},
	{
	  "<leader>hj",
	  function()
	    require("harpoon.ui").nav_next()
	  end,
	  desc = "[H]arpoon Next",
  	},
	{
	  "<leader>hk",
	  function()
	    require("harpoon.ui").nav_prev()
	  end,
	  desc = "[H]arpoon Prev",
  	},
      },
    },
    {
      "tpope/vim-sleuth",
      lazy = false
    },
    {
      "hrsh7th/cmp-nvim-lsp",
    },
    {
      "hrsh7th/cmp-buffer",
    },
    {
      "L3MON4D3/LuaSnip",
    },
    {
      "saadparwaiz1/cmp_luasnip",
    },
    {
      "hrsh7th/nvim-cmp",
      lazy = false,
      depedencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
      },
      opts = function()
        require("luasnip").config.setup({})
        local cmp = require("cmp")
        return {
          completion = {
            completeopt = "menu,menuone,noinsert"
          },
          sources = {
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
          },
          snippet = {
            expand = function(args)
              require('luasnip').lsp_expand(args.body)
            end,
          },
          mapping = cmp.mapping.preset.insert({
            ['<C-Space'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-y>'] = cmp.mapping.confirm({ select = true}),
          })
        }
      end,
    }
  },
  -- lazy options
  {}
)
