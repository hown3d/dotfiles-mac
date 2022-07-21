local M = {}
local runners = require("custom.coderunner")

M.lazygit = {
  n = {
    ["<leader>gg"] = { "<cmd>LazyGit<CR>", " Lazygit" },
  },
}


M.coderun = {
  n = {
    ["<leader>rc"] = {
      function()
        runners.run_code()
      end, "Run Code"
    },
    ["<leader>rt"] = {
      function()
        runners.test_code()
      end, "Test Code"
    },
    ["<leader>rs"] = {
      function()
        require("neotest").summary.open()
      end, "Open Test Summary"
    }
  }
}

M.buffer = {
  n = {
    ["<S-b>"] = {},
    ["<leader><S-b>"] = { "<cmd> enew <CR>", "烙 new buffer" },
  }
}

-- local gomove_mappings = {
--   ["<S-h>"] = { "<Plug>GoNSMLeft"},
--   ["<S-j>"] = { "<Plug>GoNSMDown"},
--   ["<S-k>"] = { "<Plug>GoNSMUp"},
--   ["<S-l>"] = { "<Plug>GoNSMRight"},
--
--   ["<C-h>"] = {"<Plug>GoNSDLeft" },
--   ["<C-j>"] = {"<Plug>GoNSDDown" },
--   ["<C-k>"] = {"<Plug>GoNSDUp" },
--   ["<C-l>"] = {"<Plug>GoNSDRight" },
-- }
--
-- M.gomove = {
--   n = gomove_mappings,
--   x = gomove_mappings,
-- }

-- neovide sends those characters when using alt, remap them to commands
M.macos = {
  n = {
    ["˙"] = { "<A-h>" },
    ["∆"] = { "<A-j>" },
    ["˚"] = { "<A-k>" },
    ["¬"] = { "<A-l>" },
    ["⁄"] = { "<A-i>" },
    ["√"] = { "<A-v>" },
  },
  i = {
    ["⁄"] = { "<A-i>" },
    ["√"] = { "<A-v>" },
  },
  v = {
    ["˙"] = { "<A-h>" },
    ["∆"] = { "<A-j>" },
    ["˚"] = { "<A-k>" },
    ["¬"] = { "<A-l>" },
    ["⁄"] = { "<A-i>" },
    ["√"] = { "<A-v>" },
  },
  x = {
    ["˙"] = { "<A-h>" },
    ["∆"] = { "<A-j>" },
    ["˚"] = { "<A-k>" },
    ["¬"] = { "<A-l>" },
    ["⁄"] = { "<A-i>" },
    ["√"] = { "<A-v>" },
  }
}

M.lsp = {
  n = {
    ["<leader>cl"] = {
      function()
        vim.lsp.codelens.run()
      end,
      "   lsp code_lens_run",
    },
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format()
      end,
      "   lsp format",
    },
    ["<leader>rn"] = {
      function()
        vim.lsp.buf.rename()
      end,
      "   lsp rename",
    },
    ["<leader>qd"] = { "<cmd>Trouble document_diagnostics<CR>", "   lsp document_diagnostics" },
    ["<leader>qw"] = { "<cmd>Trouble workspace_diagnostics<CR>", "   lsp workspace_diagnostics" },
  },
  v = {
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.range_code_action()
      end,
      "   lsp range_code_action",
    },
  }
}

M.trouble = {
  n = {
    ["<leader>ft"] = { "<cmd>Trouble<CR>", "Open Trouble Diagnostics" },
    ["<leader>fT"] = { "<cmd>TodoTrouble<CR>", "Find Todos with Trouble" }
  }
}

M.telescope = {
  n = {
    ["<leader>fs"] = { "<cmd>Telescope aerial<CR>", "Open symbols outline" }
  }
}

M.gitsigns = {
  n = {
    ["<leader>gn"] = {
      function()
        require("gitsigns.actions").next_hunk()
      end,
      " git next hunk"
    },
    ["<leader>gp"] = {
      function()
        require("gitsigns.actions").prev_hunk()
      end,
      " git previous hunk"
    },

    ["<leader>gb"] = {
      function()
        require("gitsigns.actions").toggle_current_line_blame()
      end,
      " git blame"
    }
  }
}

M.dap = {
  n = {
    ["<leader>Db"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Toggle Breakpoint",
    },
    ["<leader>Dl"] = {
      function()
        require("dap.ext.vscode").load_launchjs()
      end,
      "Load debug configurations from .vscode/launch.json",
    },

    ["<leader>Dc"] = {
      function()
        require("dap").continue()
      end,
      "Continue execution",
    },
    ["<leader>Ds"] = {
      function()
        require("dap").step_over()
      end,
      "Step over",
    },
    ["<leader>DS"] = {
      function()
        require("dap").step_into()
      end,
      "Step into",
    },
  },
}
--
return M
