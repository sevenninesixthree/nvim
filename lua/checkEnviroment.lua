Phone=false
SoftKeybord=false
SystemName="Linux"
local testFile=io.popen("cd")
if(testFile:read()==nil)then
  SystemName="Windows"
end
if SystemName=="Linux" then
  testFile=io.popen("uname -m")
  if testFile:read()=="aarch64" then
    Phone=true
  end
end
