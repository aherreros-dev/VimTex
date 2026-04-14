--[[
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  REAL-TIME LINTING
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Nvim-Lint: Real-time linting for multiple languages
  
  - Run linters on save and on-demand
  - Support for Python, JavaScript, Lua, Shell, etc.
  - Integrates with LSP diagnostics
  - Shows errors inline with virtual text
  - Real-time feedback without execution
--]]

return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Configure linters for different filetypes
    lint.linters_by_ft = {
      python = { "pylint" },
      javascript = { "eslint" },
      typescript = { "eslint" },
      lua = { "luacheck" },
      bash = { "shellcheck" },
      sh = { "shellcheck" },
      markdown = { "markdownlint" },
      json = { "jsonlint" },
      tex = { "chktex" },
      latex = { "chktex" },
    }

    -- Customize linter icons and formatting with Nerd Font symbols
    local icons = {
      python = " ",
      javascript = " ",
      typescript = " ",
      lua = " ",
      bash = " ",
      sh = " ",
      markdown = " ",
      json = " ",
      tex = "∑",
      latex = "∑",
    }

    -- Add custom formatting for lint messages
    for ft, _ in pairs(lint.linters_by_ft) do
      local icon = icons[ft] or "●"
      -- Format linter output with custom icons
    end

    -- Create autocmd to lint on save
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- Keybinding to run linters manually
    vim.keymap.set("n", "<leader>li", function()
      lint.try_lint()
    end, { noremap = true, silent = true })
  end,
}
