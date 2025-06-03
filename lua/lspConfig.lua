local lsp=vim.lsp
local api=vim.api
lsp.enable 'lua_ls'
lsp.enable 'clangd'
lsp.enable 'texlab'

api.nvim_create_autocmd('LspAttach',{
  group = api.nvim_create_augroup('lsp-attach',{clear=true}),
  callback=function (e)
    local c=lsp.get_client_by_id(e.data.client_id)
    vim.diagnostic.config{
      virtual_text=true;
    }
    if c and c:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
      local ag=api.nvim_create_augroup('ag',{clear=false})
      api.nvim_create_autocmd({'CursorHold','CursorHoldI'},{
        buffer=e.buf,
        group=ag,
        callback=lsp.buf.document_highlight
      })
      api.nvim_create_autocmd({'CursorMoved','CursorMovedI'},{
        buffer=e.buf,
        group=ag,
        callback=lsp.buf.clear_references
      })
    end
    api.nvim_create_autocmd('LspDetach',{
      group=api.nvim_create_augroup('lsp-detach',{clear=true}),
      callback=function (e2)
        lsp.buf.clear_references()
        api.nvim_clear_autocmds({group='ag',buffer=e2.buf})
      end
    })
  end
})
