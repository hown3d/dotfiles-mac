return {
  ["kdheepak/lazygit.nvim"] = {},
  ["ray-x/go.nvim"] = {
    config = function()
      require "custom.plugins.configs.go"
    end,
    requires = {
      { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
    }
  },
  ["Pocco81/AutoSave.nvim"] = {
    config = function()
      require "custom.plugins.configs.autosave"
    end
  },
  ["simrat39/rust-tools.nvim"] = {},
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  ["is0n/jaq-nvim"] = {
    config = function()
      require "custom.plugins.configs.jaq"
    end,
  },
  ["junegunn/fzf"] = {
    run = function()
      vim.fn['fzf#install']()
    end
  },
  ["stevearc/aerial.nvim"] = {
    config = function()
      require('aerial').setup({})
    end
  },
  ["nvim-neotest/neotest"] = {
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require('neotest-go')({
            -- experimental = {
            --   test_table = true,
            -- }
          }),
        }
      })
    end
  },
  -- ["akinsho/toggleterm.nvim"] = {
  --   tag = 'v1.*',
  --   config = function()
  --     require("toggleterm").setup()
  --   end
  -- },

  -- lsp stuff
  -- ["ray-x/navigator.lua"] = {
  --   config = function()
  --     require("navigator").setup()
  --   end,
  --   requires = {
  --     { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
  --     { 'neovim/nvim-lspconfig' },
  --   },
  -- },
  ["lukas-reineke/lsp-format.nvim"] = {
    config = function()
      require("lsp-format").setup {}
    end
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    config = function()
      require "custom.plugins.configs.null-ls"
    end,
  },
  ["ray-x/lsp_signature.nvim"] = {
    config = function()
      require "lsp_signature".setup({
        floating_window_above_cur_line = false,
      })
    end
  },
  ["folke/lua-dev.nvim"] = {},

  -- DAP Debugging
  ["mfussenegger/nvim-dap"] = {
    config = function()
      require("dap.ext.vscode").load_launchjs()
    end,
  },
  ["leoluz/nvim-dap-go"] = {
    config = function()
      require("dap-go").setup()
    end
  },
  ["rcarriga/nvim-dap-ui"] = {
    config = function()
      require "custom.plugins.configs.dap-ui"
    end
  },

  -- ui improvments
  ["kevinhwang91/nvim-bqf"] = {
    -- ft = "qf",
    config = function()
      require("bqf").setup({
        auto_enable = true,
        auto_resize_height = true, -- highly recommended enable
        preview = {
          win_height = 999, -- like fullscreen
          wrap = true,
        }
      })
    end
  },
  ["bluz71/vim-moonfly-colors"] = {},
  ["stevearc/dressing.nvim"] = {
    config = function()
      require("dressing").setup {}
    end
  },
  ["folke/todo-comments.nvim"] = {
    config = function()
      require("todo-comments").setup {
        search = {
          -- matches TODO(blabla) aswell
          pattern = [[\b(TODO)[(a-z0-9)]*:]], -- ripgrep regex
        }
      }
    end
  },
  ["folke/trouble.nvim"] = {
    config = function()
      require "custom.plugins.configs.trouble"
    end,
    requires = "nvim-lua/plenary.nvim",
  },
  ["booperlv/nvim-gomove"] = {
    config = function()
      require("gomove").setup()
    end
  },
  ["andymass/vim-matchup"] = {},
  ["mg979/vim-visual-multi"] = {},
}
