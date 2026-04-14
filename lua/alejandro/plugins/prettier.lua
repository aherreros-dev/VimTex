-- ~/.config/nvim/lua/plugins/prettier.lua
return {
  {
    "MunifTanjim/prettier.nvim",
    event = "BufReadPre",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local prettier = require("prettier")
      prettier.setup({
        bin = "prettier", -- o "prettierd"
        filetypes = {
          "javascript", "javascriptreact", "typescript", "typescriptreact",
          "json", "css", "scss", "less", "html", "markdown", "yaml", "graphql"
        },
      })

      -- formateo automático al guardar
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = {
          "*.js", "*.jsx", "*.ts", "*.tsx",
          "*.json", "*.css", "*.scss", "*.html",
          "*.md", "*.yaml", "*.graphql",
        },
        callback = function()
          vim.cmd("silent Prettier")
        end,
      })
    end,
  },
}

