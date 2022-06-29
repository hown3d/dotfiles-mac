local M = {}

M.lazygit = {
  n = {
    ["<leader>gg"] = { "<cmd>LazyGit<CR>", "Open Lazygit" },
    -- Code Runner
    -- ["<leader>rc"] = {"<cmd>RunCode<CR>", "Run Code"},
    -- ["<leader>rf"] = {"<cmd>RunFile<CR>", "Run File"},
    -- ["<leader>rft"] = {"<cmd>RunFile tab<CR>", "Run File in a new tab"},
    -- ["<leader>rp"] = {"<cmd>RunProject<CR>", "Run Project"},
    -- ["<leader>rcl"] = {"<cmd>RunClose<CR>", "Run Close"},
    -- Jaq
    ["<leader>rc"] = { "<cmd>Jaq<CR>", "Run Code" },
    ["<leader>rq"] = { "<cmd>Jaq qf<CR>", "Run Code and output in quickfix" },
    ["<leader>fs"] = { "<cmd>Telescope aerial<CR>", "Find symbols with aerial outline" },
  },
}

M.trouble = {
  n = {
    ["<leader>ft"] = { "<cmd>Trouble<CR>", "Open Trouble Diagnostics" },
    ["<leader>fT"] = { "<cmd>TodoTrouble<CR>", "Find Todos with Trouble" }
  }
}

M.toggleterm = {
  t = {
    -- toggle in terminal mode
    ["<A-i>"] = {
      "<cmd>ToggleTerm direction=float<CR>",
      "   toggle floating term",
    },

    ["<A-h>"] = {
      "<cmd>ToggleTerm direction=horizontal<CR>",
      "   toggle horizontal term",
    },

    ["<A-v>"] = {
      "<cmd>ToggleTerm direction=horizontal<CR>",
      "   toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<A-i>"] = {
      "<cmd>ToggleTerm direction=float<CR>",
      "   toggle floating term",
    },

    ["<A-h>"] = {
      "<cmd>ToggleTerm direction=horizontal<CR>",
      "   toggle horizontal term",
    },

    ["<A-v>"] = {
      "<cmd>ToggleTerm direction=horizontal<CR>",
      "   toggle vertical term",
    },

    -- new
    ["<leader>h"] = {},
    ["<leader>v"] = {},

    ["<leader>Th"] = {
      "<cmd>ToggleTerm direction=horizontal<CR>",
      "   new horizontal term",
    },


    ["<leader>Tf"] = {
      "<cmd>ToggleTerm direction=float<CR>",
      "   new float term",
    },

    ["<leader>Tt"] = {
      "<cmd>ToggleTerm direction=tab<CR>",
      "   new tab term",
    },

    ["<leader>Tv"] = {
      "<cmd>ToggleTerm direction=vertical<CR>",
      "   new vertical term",
    },
  },
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
