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

M.inMath=function ()
  local n=vim.treesitter.get_node();
  while n do
    local nt=n:type()
    if nt=="inline_formula"
    or nt=="displayed_equation"
    or nt=="math_environment" then
      return true
    end
    n=n:parent()
  end
  return false
end
M.inEnv=function (name)
  local tmp = vim.fn['vimtex#env#is_inside'](name);
  return tmp[1]>0 and tmp[2]>0
end
M.inText=function ()
  return not M.inMath()
end
return M
