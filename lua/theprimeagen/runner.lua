function Run_language()
  -- Get the filetype of the current buffer
  local filetype = vim.bo.filetype

  -- Set the command based on the filetype
  local cmd = ""
  if filetype == "python" then
    cmd = "python %"
  elseif filetype == "cpp" then
    cmd = "g++ -o output % && ./output"
  elseif filetype == "javascript" then
    cmd = "node %"
  elseif filetype == "java" then
    cmd = "javac % && java "
  elseif filetype == "cs" then
    local filename = vim.fn.expand("%:t:r")
    cmd = "mcs " .. "%" .. " && mono " .. filename .. ".exe"
  elseif filetype == "ocaml" then
    cmd = "utop"
    local filename = vim.fn.expand("%:p")
    vim.api.nvim_command("w")
    vim.api.nvim_command("split")
    vim.api.nvim_command("wincmd J")
    vim.api.nvim_command("term " .. cmd)
    vim.api.nvim_command("startinsert")
    vim.defer_fn(function()
      vim.fn.chansend(vim.b.terminal_job_id, "#use \"" .. filename .. "\";;\n")
    end, 500)
    return
  elseif filetype == "sh" then
    cmd = "bash %"
    elseif filetype == "lua" then
    cmd = "lua %"
  elseif filetype == "rust" then
    cmd = "cargo build && cargo run"
  elseif filetype == "typescript" then
    cmd = "bun run %"
  else
    print("Unsupported filetype")
    return
  end

  -- Save the current buffer
  vim.api.nvim_command("w")

  -- Create a new split
  vim.api.nvim_command("split")

  -- Switch to the bottom split
  vim.api.nvim_command("wincmd J")

  -- Set the terminal to run the appropriate command
  vim.api.nvim_command("term " .. cmd)

  -- Turn on insert mode
  vim.api.nvim_command("startinsert")
end
