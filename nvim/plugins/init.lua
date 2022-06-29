return {
  ["kdheepak/lazygit.nvim"] = {},
  ["ray-x/go.nvim"] = {
    config = function()
      require "custom.plugins.configs.go"
    end,
  },
  ["ray-x/guihua.lua"] = {},
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  ["Pocco81/AutoSave.nvim"] = {
    config = function()
      require "custom.plugins.configs.autosave"
    end,
  },
  -- ["CRAG666/code_runner.nvim"] = {
  --   requires = "nvim-lua/plenary.nvim",
  --   config = function()
  --      require "custom.plugins.configs.coderunner"
  --   end,
  -- },
  ["is0n/jaq-nvim"] = {
    config = function()
      require "custom.plugins.configs.jaq"
    end,
  },
  ["kevinhwang91/nvim-bqf"] = {
    config = function()
      require "custom.plugins.configs.bqf"
    end,
  },
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
      require("trouble").setup({})
    end
  },
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
  }
}
