local vapi = vim.api
local vui = vim.ui
local M = {}

local function get_filename()
  local buf = vapi.nvim_get_current_buf()
  local bufnr = vim.fn.bufnr(buf)
  return vim.fn.bufname(bufnr)
ecd

local function get_filetype()
  local buf = vapi.nvim_get_current_buf()
  local ft = vapi.nvim_buf_get_option(buf, "filetype")
  return ft
end

-- test_runners is a table which holds test runners based on filetype
local test_runners = {
  ["go"] = function()
    require("go.gotest").test("-n")
  end,
}


-- code_runners is a table which holds code runners based on filetype
local code_runners = {
  ["go"] = function()
    vui.input({
      prompt = "Please specify which file to run",
      default = ".",
      completion = "file_in_path"
    }, function(input)
      if !(input) then return end
      require("go.asyncmake").make("go run ", input)
    end)
  end,
  ["rust"] = function()
    require("rust-tools.runnables").runnables()
  end,
  ["dockerfile"] = function ()
    local fname = get_filename()
    vui.input({
      prompt = "Please set a tag for the docker image, leave empty to use no tag",
      default = "",
    }, function(tag)
    if !(tag) then return end
    local args = string.format("docker build -f %s", fname)
    if !(tag == "") then
      args = args .. string.format(" -t %s", tag)
    end
    require("go.asyncmake").make(args)
    end)
  end
}


function M.test_code()
  local ft = get_filetype()
  local test_func = test_runners[ft]
  if (test_func) then
    test_func()
  else
    print("no test tool registered for filetype ", ft)
  end
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
