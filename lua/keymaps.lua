vim.g.mapleader=" "

local km=vim.keymap

--insert mod
km.set("i","jk","<esc>")
if SoftKeybord==true then
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

--normal mod
km.set("n","<leader>e",":NvimTreeToggle<CR>")
km.set("n","<leader>v","gg=G")
km.set("n","<leader>ccc",":!g++ -o %< % <CR><CR>")
km.set("n","<leader>r",":!./%<")
km.set("n","<leader>p",":MarkdownPreview<CR>")
km.set("n","<leader>h",":bp<CR>")
km.set("n","<leader>l",":bn<CR>")
km.set("n","<leader>git",":terminal<CR>ilazygit<CR>")
