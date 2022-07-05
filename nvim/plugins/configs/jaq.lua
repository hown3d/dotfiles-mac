local vui = vim.ui
require('jaq-nvim').setup {
  -- Commands used with 'Jaq'
  cmds = {
    -- Default UI used (see `Usage` for options)
    default = "bang",

    -- Uses external commands such as 'g++' and 'cargo'
    external = {
      typescript = "deno run %",
      javascript = "node %",
      markdown = "glow %",
      python = "python3 %",
      rust = "cargo run",
      cpp = "clang % -o $fileBase && ./$fileBase",
      c = "clang % -o $fileBase && ./$fileBase",
      go = "go run %",
      dockerfile = function()
        local cmd
        local callback = function(tag)
          if not tag then
            return
          end
          cmd = "docker build -f %"
          if not tag == "" then
            cmd = cmd .. string.format(" -t %s", tag)
          end
        end
        vui.input({
          prompt = "Please set a tag for the docker image, leave empty to use no tag",
          default = "",
          completion = "",
        }, callback)
      end,
      sh = "sh %"
    },

    -- Uses internal commands such as 'source' and 'luafile'
    internal = {
      lua = "luafile %",
      vim = "source %"
    }
  },

  -- UI settings
  ui = {
    -- Start in insert mode
    startinsert = false,

    -- Switch back to current file
    -- after using Jaq
    wincmd = false,

    -- Floating Window / FTerm settings
    float = {
      -- Floating window border (see ':h nvim_open_win')
      border = "none",

      -- Num from `0 - 1` for measurements
      height = 0.8,
      width  = 0.8,
      x      = 0.5,
      y      = 0.5,

      -- Highlight group for floating window/border (see ':h winhl')
      border_hl = "FloatBorder",
      float_hl  = "Normal",

      -- Floating Window Transparency (see ':h winblend')
      blend = 0
    },

    terminal = {
      -- Position of terminal
      position = "bot",

      -- Open the terminal without line numbers
      line_no = false,

      -- Size of terminal
      size = 10
    },

    toggleterm = {
      -- Position of terminal, one of "vertical" | "horizontal" | "window" | "float"
      position = "horizontal",

      -- Size of terminal
      size = 10
    },

    quickfix = {
      -- Position of quickfix window
      position = "bot",

      -- Size of quickfix window
      size = 15
    }
  }
}
