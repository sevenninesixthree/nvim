--的lsp表
local lspList={
  "lua_ls","clangd","texlab","matlab_ls","fortls","pylsp"
}
require("mason").setup({
  ui={
    icons={
      package_installed="✓",
      package_pending="→",
      package_uninstalled="·"
    }
  }
})
require("mason-lspconfig").setup({
  ensure_installed=lspList
})
local capabilities = require('cmp_nvim_lsp').default_capabilities()
for i,v in ipairs(lspList) do
  require("lspconfig")[v].setup{
    capabilities=capabilities
  }
end
