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
km.set("n","<leader>sj",":split<CR>")
km.set("n","<leader>sl",":vsplit<CR>")

km.set("n","<leader>git",":terminal<CR>ilazygit<CR>")
km.set("n","<leader>t",":terminal<CR>")
