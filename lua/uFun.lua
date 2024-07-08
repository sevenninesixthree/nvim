M={}
local sysname=require("checkEnviroment").systemName
function M.getPath()
  local fileSpliter='/';
  if sysname=="Windows" then
    fileSpliter='\\'
  end
  local path=vim.fn.input("Path to executable: ",vim.fn.getcwd()..fileSpliter,'file');
  if sysname=="Windows" then
    path=string.gsub(path,'\\','/')
  end
  return path
end
return M
