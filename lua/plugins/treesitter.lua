return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
        ensure_installed = {
          -- 기존
          "lua", "python", "javascript", "html", "markdown", "ruby",
          -- Node/TypeScript
          "typescript", "tsx", "jsdoc", "json", "jsonc", "yaml", "css", "scss",
          -- Rails/Ruby
          "embedded_template", "eruby", "rbs",
          -- 공통
          "bash", "dockerfile", "gitignore", "gitcommit", "diff",
          "vim", "vimdoc", "regex", "markdown_inline",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
  end
}