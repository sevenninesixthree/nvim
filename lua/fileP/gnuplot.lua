-- local au = vim.api.nvim_create_autocmd
local vl = vim.loop
local np = vl.new_pipe
local pips = {
  stdin = nil, stdout = nil, stderr = nil, handel = nil
}
local M = {}
M.callback = function()
  local buf = vim.api.nvim_get_current_buf()
  local dir = vim.fn.expand("%:p:h")
  if pips.handel == nil then
    pips.stdin = np(false)
    pips.stderr = np(false)
    pips.stdout = np(false)
    pips.handel = vl.spawn("gnuplot", {
      cwd = dir,
      stdio = { pips.stdin, pips.stdout, pips.stderr }
    }, function(code, signal)
      vim.schedule(function()
        if code ~= 0 then
          vim.notify("gnuplot exit with code " .. code, vim.log.levels.ERROR)
        elseif signal ~= 0 then
          vim.notify("gnuplot receive signal " .. signal, vim.log.levels.INFO)
        else
          vim.notify("gnuplot exit with no error", vim.log.levels.INFO)
        end
      end)
    end)
    pips.stderr:read_start(function(_, data)
      if data then
        vim.schedule(function()
          vim.notify(data, vim.log.levels.WARN)
        end)
      end
    end)
    pips.stdout:read_start(function(_, data)
      if data then
        vim.schedule(function()
          vim.notify(data, vim.log.levels.INFO)
        end)
      end
    end)
  end
  pips.stdin:write("load '" .. vim.api.nvim_buf_get_name(buf) .. "'\n\n")
end
return M
