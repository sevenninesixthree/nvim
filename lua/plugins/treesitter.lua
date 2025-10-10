vim.api.nvim_create_autocmd({'BufEnter','BufWinEnter'}, {
  pattern = { '*.lua','*.cpp','*.c','*.h','*.tex','*.glsl','*.sh',"*.py","*.md","*.js","*.ts","*.sql","*.typ"},
  callback = function()
    vim.treesitter.start()
    if vim.treesitter.query.get(vim.bo.filetype,"indents")~=nil then
      vim.bo.indentexpr="v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
require("nvim-treesitter").install({
  "cpp","markdown","markdown_inline","typescript","sql","glsl","latex","lua","bash","typst"
})

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
    latex = 210,
    cpp = 210
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
  log={
  }
}
-- vim.api.nvim_create_autocmd("WinScrolled", {
--   callback = function()
--     require("rainbow-delimiters").enable(0)
--   end,
-- })
