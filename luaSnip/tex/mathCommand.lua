M={}
local inMath=require("uFun").inMath
local inText=require("uFun").inText
local ls=require("luasnip")
local s=ls.snippet
local sn=ls.snippet_node
local d=ls.dynamic_node
local i=ls.insert_node
local fmta=require("luasnip.extras.fmt").fmta
local builder=function (_,p)
  if #p.snippet.env.LS_SELECT_RAW>0 then
    return sn(nil,i(1,p.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil,i(1))
  end
end
local command={
  {{
    {"lx","\\left(<>\\right)"},-- 小(xc)
    {"lv","\\left[<>\\right]"},-- 中(vs)
    {"ld","\\left\\{<>\\right\\}"},-- 大(da)
    {"la","\\left|<>\\right|"},-- abs, |...|
    {"lc","\\left\\{\n\t<>\n\\right."},
    {"dot","\\dot{<>}"},
    {"ddot","\\ddot{<>}"},
    {"sqrt","\\sqrt{<>}"}
  },inMath,
    function () return {d(1,builder)} end},
  {{
    {"frac","\\frac{<>}{<>}"},
    {"int","\\int_{<>}^{<>}"},
    {"oint","\\oint_{<>}^{<>}"},
    {"sum","\\sum_{<>}^{<>}"},
    {"msqrt","\\sqrt[<>]{<>}"}
  },inMath,
    function () return {i(1),i(2)} end},
  {{
    {"mi","$ <> $"},
    {"ml","$$\n<>\n$$"},
  },inText,
    function () return {i(1)} end}
}
for _, a in ipairs(command) do
  for _, b in ipairs(a[1]) do
    table.insert(M,s({trig=b[1],show_condition=a[2]},
    fmta(b[2],a[3]())))
  end
end
return M
