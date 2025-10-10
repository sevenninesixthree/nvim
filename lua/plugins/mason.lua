--的lsp表
-- local lspList={
--   "lua_ls","clangd","texlab","matlab_ls","fortls","pylsp","gopls","cmake","glsl_analyzer","ts_ls"
-- }
require("mason").setup({
  ui={
    icons={
      package_installed="✓",
      package_pending="→",
      package_uninstalled="·"
    }
  }
})
-- require("mason-lspconfig").setup({
--   ensure_installed=lspList
-- })
