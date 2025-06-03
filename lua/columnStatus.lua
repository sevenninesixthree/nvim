local M={}
function M.callback()
  local buf=vim.api.nvim_get_current_buf()
  local type=vim.bo[buf].buftype
  if type=="" then
    vim.o.statuscolumn='%{%v:lua.require("columnStatus").build()%}'
  else
    vim.o.statuscolumn=""
  end
end

local vv=vim.v;local fn=vim.fn
local fl=fn.foldlevel;local fc=fn.foldclosed
function M.build()
  local ln=vv.lnum;local rn=vv.relnum;local vn=vv.virtnum
  local nm=vn<=0 and (rn==0 and ln.." %=" or "%="..rn) or "%="
  local fo="  "
  if fl(ln)>fl(ln-1) and vn <=0 then
    fo=(fc(ln)==-1 and " " or " ")
    -- fo='%#FoldColumn#%@Hi@'..(fc(ln)==-1 and " " or " ").."%*"
  end
  return "%s"..nm.."%#FoldColumn#%@v:lua.FoldToggle@"..fo.."%*│"
end

function _G.FoldToggle()
  local ln=fn.getmousepos().line;
  if fl(ln)>fl(ln-1) then
    if fc(ln)==-1 then
      vim.cmd(ln.."foldclose")
    else
      vim.cmd(ln.."foldopen")
    end
  end
end

return M
