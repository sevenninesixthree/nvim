Phone=false
SoftKeybord=false
SystemName="Windows"
local testFile=io.popen("cd")
if(testFile:read()==nil)then
  SystemName="Linux"
end
if SystemName=="Linux" then
  testFile=io.popen("uname -m")
  if testFile:read()=="aarch64" then
    Phone=true
  end
end
