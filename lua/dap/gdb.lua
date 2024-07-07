local dap=require("dap")
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" }
}
dap.configurations.cpp={
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = require("uFun").getPath,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
}
dap.configurations.c=dap.configurations.cpp
