local keyMapper = require('utils.keyMapper').mapKey

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { "lua_ls", "biome", "pylsp", "solargraph" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({})
      lspconfig.biome.setup({})
      lspconfig.pylsp.setup({})
      lspconfig.solargraph.setup({
        settings = {
          solargraph = {
            diagnostics = true,
            completion = true,
            formatting = true,
          }
        }
      })

      -- vim.lsp.buf.hover
      -- vim.lsp.buf.definition
      -- vim.lsp.buf.code_action
      keyMapper('K', vim.lsp.buf.hover)
      keyMapper('gd', vim.lsp.buf.definition)
      keyMapper('<leader>ca', vim.lsp.buf.code_action)
    end
  }
}