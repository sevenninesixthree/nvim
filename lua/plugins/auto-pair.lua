local options={
  disabled_filetypes = { "text" },
  disable_when_touch = false,
  touch_regex = "[%w(%[{]",
  pair_spaces = false,
  auto_indent = true,
  disable_command_mode = false,
}
local keys
if require'checkEnviroment'.softKeybord==true then
  keys={
    ["("] = { escape = false, close = true, pair = "()" },
    ["["] = { escape = false, close = true, pair = "[]" },
    ["{"] = { escape = false, close = true, pair = "{}" },

    [">"] = { escape = true, close = false, pair = "<>" },
    [")"] = { escape = true, close = false, pair = "()" },
    ["]"] = { escape = true, close = false, pair = "[]" },
    ["}"] = { escape = true, close = false, pair = "{}" },

    ['"'] = { escape = true, close = true, pair = '""' },
    ["'"] = { escape = true, close = true, pair = "''" },
    ["`"] = { escape = true, close = true, pair = "``" },
    ["$"] = { escape = true, close = true, pair = "$$"},

    ["<C-f>"] = { escape = false, close = true, pair = "[]" },
    ["<C-k>"] = { escape = false, close = true, pair = "{}" },
    ["qq"] = { escape = true, close = true, pair = '""' },
  }
else
  keys={
    ["("] = { escape = false, close = true, pair = "()" },
    ["["] = { escape = false, close = true, pair = "[]" },
    ["{"] = { escape = false, close = true, pair = "{}" },

    [">"] = { escape = true, close = false, pair = "<>" },
    [")"] = { escape = true, close = false, pair = "()" },
    ["]"] = { escape = true, close = false, pair = "[]" },
    ["}"] = { escape = true, close = false, pair = "{}" },

    ['"'] = { escape = true, close = true, pair = '""' },
    ["'"] = { escape = true, close = true, pair = "''" },
    ["`"] = { escape = true, close = true, pair = "``" },
    ["$"] = { escape = true, close = true, pair = "$$"}
  }
end
local config = {
  keys =keys,
  options =options
}
require("autoclose").setup(config)

