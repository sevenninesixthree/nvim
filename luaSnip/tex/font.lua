local ls=require("luasnip")
local s=ls.snippet
local sn=ls.snippet_node
local i=ls.insert_node
local d=ls.dynamic_node
local fmta=require("luasnip.extras.fmt").fmta
local uF=require("uFun")
local inText=uF.inText
local inMath=uF.inMath
local builder=function (_,p)
  if #p.snippet.env.LS_SELECT_RAW>0 then
    return sn(nil,i(1,p.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil,i(1))
  end
end
local fontList={
  -- Trigger,ConditionFunction,Command
  {'tii',inText,'textit'},-- 斜体
  {'tbf',inText,'textbf'},-- 粗体
  {'mbb',inMath,'mathbb'},-- 黑板粗体
  {'mbs',inMath,'boldsymbol'},-- 数学符号粗体
}
M={}
for _, j in ipairs(fontList) do
  table.insert(M,
    s({trig=j[1],show_condition=j[2]},
    fmta('\\'..j[3].."{<>}",d(1,builder))))
end
return M
