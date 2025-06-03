vim.api.nvim_create_autocmd({'BufEnter','BufWinEnter'}, {
  pattern = { '*.lua','*.cpp','*.c','*.h','*.tex','*.glsl','*.sh'},
  callback = function() vim.treesitter.start() end,
})

local colors={
  "#f7768e",
  "#e0af68",
  "#9ece6a",
  "#1abc9c",
  "#7aa2f7",
  "#bb9af7",
  "#9d7cd8"
}

for i = 1,#colors do
  vim.cmd("hi rainbowcol"..i.." guifg="..colors[i])
end

require("colorizer").setup()

vim.g.rainbow_delimiters = {
  strategy = {
    [''] = 'rainbow-delimiters.strategy.global',
    vim = 'rainbow-delimiters.strategy.local',
  },
  query = {
    [''] = 'rainbow-delimiters',
    lua = 'rainbow-blocks',
    latex = 'rainbow-blocks'
  },
  priority = {
    [''] = 110,
    lua = 210,
  },
  highlight = {
    'RainbowDelimiterRed',
    'RainbowDelimiterYellow',
    'RainbowDelimiterBlue',
    'RainbowDelimiterOrange',
    'RainbowDelimiterGreen',
    'RainbowDelimiterViolet',
    'RainbowDelimiterCyan',
  },
  log={level=vim.log.levels.DEBUG}
}
