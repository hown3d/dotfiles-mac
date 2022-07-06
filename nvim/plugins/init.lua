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
  ["hown3d/jaq-nvim"] = {
    config = function()
      require "custom.plugins.configs.jaq"
    end,
  },
  ["junegunn/fzf"] = {
    run = function()
      vim.fn['fzf#install']()
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
  -- override lazyloading
  ["williamboman/nvim-lsp-installer"] = {},

  -- DAP Debugging
  ["hown3d/nvim-dap"] = {
    branch = "vscode-launch",
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
      })
    end
  },
  ["stevearc/dressing.nvim"] = {
    config = function()
      require("dressing").setup {}
    end
  },
  ["folke/todo-comments.nvim"] = {
    config = function()
      require("todo-comments").setup {}
    end
  },
  ["folke/trouble.nvim"] = {
    config = function()
      require "custom.plugins.configs.trouble"
    end
  },
  ["booperlv/nvim-gomove"] = {
    config = function()
      require("gomove").setup()
    end
  },
  ["mg979/vim-visual-multi"] = {},
}
