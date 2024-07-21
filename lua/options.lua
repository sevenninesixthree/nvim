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
require("lualine").setup({
  options={
    theme='tokyonight'
  }
})
vim.cmd[[colorscheme tokyonight-night]]
