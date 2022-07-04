return {
  ["kdheepak/lazygit.nvim"] = {},
  ["ray-x/go.nvim"] = {
    config = function()
      require("go").setup()
    end,
  },
  ["Pocco81/AutoSave.nvim"] = {
    config = function()
      require "custom.plugins.configs.autosave"
    end
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    config = function()
      require "custom.plugins.configs.null-ls"
    end,
  },
  ["simrat39/rust-tools.nvim"] = {},
  ["ray-x/guihua.lua"] = {},
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  ["is0n/jaq-nvim"] = {
    config = function()
      require "custom.plugins.configs.jaq"
    end,
  },
  -- ["kevinhwang91/nvim-bqf"] = {
  --   config = function()
  --     require "custom.plugins.configs.bqf"
  --   end,
  -- },
  ["junegunn/fzf"] = {
    run = function()
      vim.fn['fzf#install']()
    end
  },
  ["akinsho/toggleterm.nvim"] = {
    tag = 'v1.*',
    config = function()
      require("toggleterm").setup()
    end
  },
  ["folke/trouble.nvim"] = {
    config = function()
      require "custom.plugins.configs.trouble"
    end
  },
  -- lsp stuff
  ["ray-x/navigator.lua"] = {
    config = function()
      require("navigator").setup()
    end
  },
  -- override lazyloading
  ["williamboman/nvim-lsp-installer"] = {},
  -- DAP Debugging
  ["hown3d/nvim-dap"] = {
    branch = "vscode-launch",
    config = function()
      require("dap.ext.vscode").load_launchjs()
    end,
  },
  ["ray-x/lsp_signature.nvim"] = {
    config = function()
      require "lsp_signature".setup()
    end
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

  ["folke/todo-comments.nvim"] = {
    config = function()
      require("todo-comments").setup {}
    end
  },
  ["stevearc/dressing.nvim"] = {
    config = function()
      require("dressing").setup {}
    end
  }
}
