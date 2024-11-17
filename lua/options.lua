local op=vim.opt
op.number=true
op.relativenumber=true

op.autoindent=true
op.expandtab=true
op.tabstop=2
op.shiftwidth=2
op.linebreak=true

op.splitright=true
op.splitbelow=true

op.foldmethod="indent"
op.foldlevel=99

op.termguicolors=true
op.signcolumn="yes"
op.cursorline=true

op.spelllang="en,cjk"
op.spelloptions="camel"

local uname=require("checkEnviroment").systemName
local ph=require("checkEnviroment").phone
if uname=="Linux" and ph==false then
  require("tokyonight").setup({
    transparent = true, -- Enable this to disable setting the background color
    styles={
      sidebars="transparent",
      floats="transparent",
    },
    on_colors=function (colors)
      colors.bg_statusline=colors.none
    end
  })
end
require("lualine").setup({
  options={
    theme='tokyonight'
  }
})
vim.cmd[[colorscheme tokyonight-night]]
vim.cmd("hi LineNrAbove guifg=#586291")
vim.cmd("hi LineNrBelow guifg=#586291")
