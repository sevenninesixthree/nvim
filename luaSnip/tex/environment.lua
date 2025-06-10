M={}
local ls=require("luasnip")
local s=ls.snippet
local sn=ls.snippet_node
local i=ls.insert_node
local rep=require("luasnip.extras").rep
local tn=ls.text_node
local d=ls.dynamic_node
local fmta=require("luasnip.extras.fmt").fmta
local inMath=require("uFun").inMath

table.insert(M,s("equation",fmta(
  "\\begin{equation<>}\n\t<>\n\\end{equation<>}",
  {i(1),d(2,function (_,p)
    local l=p.snippet.env.LS_SELECT_RAW
    if #l>0 then
      if l[1]=="$$" then
        local t={}
        for k = 2, #l-1 do
          table.insert(t,l[k])
        end
        return sn(nil,i(1,t))
      end
      return sn(nil,i(1,l))
    end
    return sn(nil,i(1))
  end),rep(1)}
)))

table.insert(M,s(
  {trig="aligned",condition=inMath},fmta(
  "\\begin{aligned}\n<>\n\\end{aligned}",
  {d(1,function (_,p)
    local l=p.snippet.env.LS_SELECT_RAW
    if #l>0 then return sn(nil,
      fmta("<>\\\\\n\t<>",{i(1,l),i(2)})) end
    return sn(nil,{tn("\t"),i(1)})
  end)}
)))
return M
