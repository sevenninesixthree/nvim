M={}
local ls=require("luasnip")
local s=ls.snippet
local i=ls.insert_node
local t=ls.text_node
local command={
  "label","ref"
}
for _, k in ipairs(command) do
  table.insert(M,s(k,{
    t("\\"..k.."{"),i(1),t("}")
  }))
end
return M
