require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query","cpp","markdown","markdown_inline","latex","bash","python","go"},

  highlight = {enable = true},
  indent={enable=true},
  rainbow={
    enable=true,
    extended_mode=true,
    max_file_lines=nil,
  }
}

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
