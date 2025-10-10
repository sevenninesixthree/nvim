local iron = require("iron.core")

iron.setup({
  config = {
    -- 如果 Wolfram 可执行文件不在 PATH 中，指定完整路径
    scratch_repl = true,
    repl_definition = {
      wolfram = {
        command = {"wolfram"},  -- 或 "wolfram" 取决于你的安装
      }
    },
    repl_open_cmd = require('iron.view').split.vertical("40%"),
  },
  -- 忽略这些如果你不需要默认键位映射
  -- keymaps = {
  --   send_motion = "<space>sc",
  --   visual_send = "<space>sc",
  --   send_file = "<space>sf",
  --   send_line = "<space>sl",
  --   send_until_cursor = "<space>su",
  --   send_mark = "<space>sm",
  --   mark_motion = "<space>mc",
  --   mark_visual = "<space>mc",
  --   remove_mark = "<space>md",
  --   cr = "<space>s<cr>",
  --   interrupt = "<space>s<space>",
  --   exit = "<space>sq",
  --   clear = "<space>cl",
  -- },
  highlight = {
    italic = true
  },
})
