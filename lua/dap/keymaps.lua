local km=vim.keymap
local dap=require("dap")
local dapui=require("dapui")
km.set("n","<leader>jj",dap.toggle_breakpoint)
km.set("n","<leader>5",function ()dap.continue()end)
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
