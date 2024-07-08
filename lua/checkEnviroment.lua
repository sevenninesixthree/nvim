M={}
M.phone=false
M.softKeybord=false
M.systemName="Windows"
local testFile=io.popen("cd")
if(testFile:read()==nil)then
  M.systemName="Linux"
end
if M.systemName=="Linux" then
  testFile=io.popen("uname -m")
  if testFile:read()=="aarch64" then
    M.phone=true
  end
end
return M
