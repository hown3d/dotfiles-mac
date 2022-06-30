return {
  ["kdheepak/lazygit.nvim"] = {},
  ["hown3d/go.nvim"] = {
    config = function()
      require("go").setup()
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
