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

op.foldlevel=99 -- Using ufo provider need a large value, feel free to decrease the value
op.foldlevelstart=99
op.foldenable=true
op.winborder="rounded"
op.updatetime=1000

require('ufo').setup({
  provider_selector=function(bufnr, filetype, buftype)
    return {'treesitter', 'indent'}
  end,
  fold_virt_text_handler=function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = (' 󰁂 %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
      local chunkText = chunk[1]
      local chunkWidth = vim.fn.strdisplaywidth(chunkText)
      if targetWidth > curWidth + chunkWidth then
        table.insert(newVirtText, chunk)
      else
        chunkText = truncate(chunkText, targetWidth - curWidth)
        local hlGroup = chunk[2]
        table.insert(newVirtText, {chunkText, hlGroup})
        chunkWidth = vim.fn.strdisplaywidth(chunkText)
        -- str width returned from truncate() may less than 2nd argument, need padding
        if curWidth + chunkWidth < targetWidth then
          suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
        end
        break
      end
      curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
  end
})

op.termguicolors=true
op.signcolumn="yes"
op.cursorline=true

op.spelllang="en,cjk"
op.spelloptions="camel"

vim.api.nvim_create_autocmd({"WinEnter","BufEnter"},{
  callback=require("columnStatus").callback
})

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
    end,
    on_highlights = function(hl, c)
      hl.TabLineFill = {
        bg = c.none,
      }
    end,
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
vim.cmd("hi FoldColumn guifg=#7AA2F7")
