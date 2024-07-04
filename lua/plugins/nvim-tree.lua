local mywidth=30
if Phone==true then
  mywidth=50
end
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup({
  view={width=mywidth},
  filters={
    git_ignored=false
  }
})
