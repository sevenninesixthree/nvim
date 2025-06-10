M={}
local inMath=require("uFun").inMath
local ls=require("luasnip")
local s=ls.snippet
local t=ls.text_node
local alphabet={
  -- Trigger,LetterCommand
  -- 因输入法中 ox 开头能用来输入希腊(xila)字母，故使用
  {"xa","alpha"},
  {"xb","beta"},
  {"xg","gamma"},
  {"Xg","Gamma"},
  {"xth","theta"},
  {"Xth","Theta"},
  {"xf","phi"},
  {"Xf","Phi"},
  {"xvf","varphi"},
  {"xp","pi"},
  {"xvp","varpi"},
  {"Xp","Pi"},
  {"xo","omega"},
  {"Xo","Omega"},

  {"partial","partial"},
  {"cos","cos"},
  {"sin","sin"},
  {"tan","tan"},
  {"cot","cot"}
}
for _, i in ipairs(alphabet) do
  table.insert(M,s({trig=i[1],show_condition=inMath},
    {t('\\'..i[2])}))
end
return M
