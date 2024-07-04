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

op.termguicolors=true
op.signcolumn="yes"
op.cursorline=true
require("lualine").setup()
vim.cmd[[colorscheme tokyonight-night]]
