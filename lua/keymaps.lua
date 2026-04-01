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

km.set("n","sp","\"+p")
km.set("n","syy","\"+yy")
km.set("v","sy","\"+y")
km.set("n","<leader>sv",":loadview<CR>")

km.set("n","<leader>e",":NvimTreeToggle<CR>")
km.set("n","<leader>v",function ()
  if vim.lsp.get_clients({bufnr=0})[1] then
    vim.lsp.buf.format()
    return
  end
  vim.cmd("gg=G")
end);
km.set("n","gca",vim.lsp.buf.code_action)
km.set("n","<leader>r",":!./%<")
-- km.set("n","<C-a>","ggVG")
local lpList={
  markdown=function ()
    vim.cmd("MarkdownPreviewToggle")
  end,
  pdf=function ()
    vim.system({'sioyek',vim.api.nvim_buf_get_name(0)})
  end,
  typst=function ()
    vim.cmd("silent! TypstPreviewToggle")
  end
}
setmetatable(lpList,{
  __index=function (_, k)
    vim.notify(k,vim.log.levels.WARN)
    return function () end
  end
})
km.set("n","<leader>p",function ()
  local ft=vim.bo.filetype
  lpList[ft]();
end)

km.set("n","<leader>h",":bp<CR>")
km.set("n","<leader>l",":bn<CR>")
km.set("n","<leader>c",":bd<CR>")
km.set("n","<leader>sj",":split<CR>")
km.set("n","<leader>sl",":vsplit<CR>")
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
