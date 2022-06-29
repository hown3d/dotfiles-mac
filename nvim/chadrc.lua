-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "tokyonight",
}

M.mappings = require "custom.mappings"


local telescope = require "custom.plugins.configs.telescope"
local nvterm = require "custom.plugins.configs.nvterm"
local nvimtree = require "custom.plugins.configs.nvimtree"

M.plugins = {
  override = {
    ["nvim-telescope/telescope.nvim"] = telescope,
    ["NvChad/nvterm"]                 = nvterm,
    ["kyazdani42/nvim-tree.lua"]      = nvimtree,
  },
  user = require "custom.plugins",
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
}

M.options = {
  user = function()
    require("custom.options")
  end
}


return M
