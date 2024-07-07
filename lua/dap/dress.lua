local sd=vim.fn.sign_define
local base={text='', texthl='', linehl='', numhl=''}
local pair={
  {"DapBreakpoint","","Error"},
  {"DapBreakpointCondition","","Error"},
  {"DapLogPoint","","Error"},
  {"DapBreakpointRejected","","Error"},
  {"DapStopped","","String"}
}
for i=1,#pair do
  base.text=pair[i][2]
  base.texthl=pair[i][3]
  base.numhl=pair[i][3]
  sd(pair[i][1],base)
end
