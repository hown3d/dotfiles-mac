local vapi = vim.api
local vui = vim.ui
local M = {}

-- local function get_filename()
--   local buf = vapi.nvim_get_current_buf()
--   local bufnr = vim.fn.bufnr(buf)
--   return vim.fn.bufname(bufnr)
-- end

local function get_filetype()
  local buf = vapi.nvim_get_current_buf()
  local ft = vapi.nvim_buf_get_option(buf, "filetype")
  return ft
end


-- code_runners is a table which holds code runners based on filetype
local code_runners = {
  ["go"] = function()
    vui.input({
      prompt = "Please specify which file to run",
      default = ".",
      completion = "file_in_path"
    }, function(input)
      if not input then
        return
      end
      require("go.asyncmake").make("go run ", input)
    end)
  end,
  ["rust"] = function()
    require("rust-tools.runnables").runnables()
  end,
}


function M.test_code()
  local file, func, package, everything = "file", "func", "package", "everything"
  local neotest = require("neotest")
  vui.select({file, func, package, everything}, {
    prompt = "Select which type of test to run"
  },function (choice)
    if not choice then
      return
    end
    local neotest_arg
    if choice == file then
      neotest_arg = vim.fn.expand("%")
    elseif choice == everything then
      neotest_arg = vim.fn.getcwd()
    elseif choice == func then
      neotest_arg = nil
    elseif choice == package then
      -- directory
      neotest_arg = vim.fn.expand("%:h")
    end
    neotest.run.run(neotest_arg)
    -- only open summary if more then the current func is executed
    if neotest_arg ~= nil then
      neotest.summary.open()
    end
  end)
end

function M.run_code()
  local ft = get_filetype()
  local run_func = code_runners[ft]
  if (run_func) then
    run_func()
  else
    print("no special run tool registered for filetype", ft, ". Using Jaq:")
    vim.cmd("Jaq qf")
  end
end

return M
