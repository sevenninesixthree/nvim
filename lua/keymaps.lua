vim.g.mapleader=" "

local km=vim.keymap

km.set("i","jk","<esc>")
km.set("t","<C-w>","<C-\\><C-n>")

if require("checkEnviroment").softKeybord==true then
  km.set("i","qq","\"")
  km.set("i","<C-w>","<")
  km.set("i","<C-e>","=")
  km.set("i","<C-r>",">")
  km.set("i","zz","\\")
  km.set("i","<C-f>","[")
  km.set("i","<C-g>","]")
  km.set("i","<C-k>","{")
  km.set("i","<C-l>","}")
  km.set("i","<C-j>","+")
  km.set("i","<C-d>","^")
end

km.set("n","<leader>e",":NvimTreeToggle<CR>")
km.set("n","<leader>v","gg=G")
km.set("n","<leader>r",":!./%<")
km.set("n","<C-a>","ggVG")
km.set("n","<leader>p",":MarkdownPreview<CR>")

km.set("n","<leader>h",":bp<CR>")
km.set("n","<leader>l",":bn<CR>")
km.set("n","<leader>c",":bd<CR>")
km.set("n","<leader>sp",":set spell!<CR>")
km.set("n","<leader>sc",":%s/[\\u4E00-\\u9FCC]/&/g<CR>")

if require("checkEnviroment").systemName=="Linux"
  and require("checkEnviroment").phone==false
then
  km.set("n","<leader>wt",":!kitty fish &<CR><CR>")
  km.set("n","<leader>wg",":!kitty lazygit &<CR><CR>")
end

if require("checkEnviroment").systemName=="Linux" then
  km.set("n","<leader>t",":terminal<CR>ifish<CR>")
else
  km.set("n","<leader>t",":terminal<CR>")
end
km.set("n","<leader>g",":terminal<CR>ilazygit<CR>")
