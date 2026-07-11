local au=vim.api.nvim_create_autocmd
local tmpBuf=vim.api.nvim_create_buf(false,true)
local tmpWinIsClose=true
au("WinClosed",{
  buffer=tmpBuf,
  callback=function ()
    tmpWinIsClose=true
  end
})
vim.api.nvim_buf_set_name(tmpBuf,"temp://sqliteOutput")
return {
  callback= function()
    local buf = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(buf, 0, 2, false)
    local db = lines[1]
    local auto = lines[2]
    local bufname=vim.api.nvim_buf_get_name(buf)
    db = db:gsub("^%s*%-%-%s*", "")
    local dir = vim.fn.expand("%:p:h")
    local f = function()
      vim.system({ "sqlite3", db, "-init", bufname }, { cwd = dir }, function(out)
        vim.schedule(function()
          if out.stderr ~= "" then
            vim.notify(out.stderr:gsub(bufname,"__FILE__"), vim.log.levels.WARN)
            return
          end
          if out.stdout ~= "" then
            local datas=vim.split(out.stdout,'\n')
            vim.api.nvim_buf_set_lines(tmpBuf,0,-1,false,datas)
            if tmpWinIsClose then
              vim.api.nvim_command("vertical sbuffer "..tmpBuf)
              tmpWinIsClose=false
            end
            return
          end
          vim.notify("success", vim.log.levels.INFO)
        end)
      end)
    end
    local gr = vim.api.nvim_create_augroup("SQliteBuf_" .. buf, { clear = true })
    if auto == "-- auto" then
      au("BufWritePost", {
        group = gr,
        buffer = buf,
        callback = f
      })
      au("BufDelete", {
        buffer = buf,
        callback = function()
          vim.api.nvim_clear_autocmds({ group = gr })
        end
      })
    else
      f()
    end
  end
}
