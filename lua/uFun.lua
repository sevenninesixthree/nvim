M={}
function M.getPath()
  local fileSpliter='/';
  if SystemName=="Windows" then
    fileSpliter='\\'
  end
  local path=vim.fn.input("Path to executable: ",vim.fn.getcwd()..fileSpliter,'file');
  if SystemName=="Windows" then
    path=string.gsub(path,'\\','/')
  end
  return path
end
return M
