local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },{
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },{
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    }
  },
  {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate'
  },
  {
    "hiphish/rainbow-delimiters.nvim",
    lazy=false
  },
  {
    "williamboman/mason.nvim"
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp"
  },
  {
    'saghen/blink.cmp',
    version = '1.*',
    opts = {
      sources = {
        default = { "lsp", "snippets", "path", "buffer" },  -- snippets 优先
        providers = {
          snippets = {
            score_offset = 3,  -- 提高权重
          },
        },
      },
      completion={
        accept={
          auto_brackets={enabled=false}
        },
        documentation={
          auto_show=true
        },
        menu={
          draw={
            columns=
            {{'kind_icon'},{'label',gap=1}},
            components={
              label={
                text=function (ctx)
                  return ctx.label .. ctx.label_detail
                end,
                highlight=function (ctx)
                  local h={
                    {0,#ctx.label,group=ctx.kind_hl}
                  }
                  if ctx.label_detail then
                    table.insert(h,{
                      #ctx.label,#ctx.label+#ctx.label_detail,group='Comment'
                    })
                  end
                  for _, i in ipairs(ctx.label_matched_indices) do
                    table.insert(h,{i,i+1,group='String'})
                  end
                  return h;
                end
              }
            }
          }
        },
      },
      keymap={
        ['C-y']={},
        ['C-u']={},
        ['<CR>']={ 'accept', 'fallback'},
        ['<S-Tab>']={'select_prev','snippet_backward','fallback_to_mappings'},
        ['<Tab>']={'select_next','snippet_forward','fallback_to_mappings'},
      },
      signature={enabled=true},
      snippets = { preset = 'luasnip' }
    },
  },
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      vim.g.vimtex_view_method='zathura'
      vim.g.vimtex_quickfix_mode=0
    end
  },{
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_theme = 'dark'
    end,
    ft = { "markdown" },
  },
  {'m4xshen/autoclose.nvim'},
  {"lewis6991/gitsigns.nvim"},
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  {"mfussenegger/nvim-dap"},
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
  {"theHamsta/nvim-dap-virtual-text"},
  {"mechatroner/rainbow_csv"},
  {"norcalli/nvim-colorizer.lua"},
  {'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async'},
})
