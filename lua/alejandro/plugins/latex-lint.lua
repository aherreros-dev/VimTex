--[[
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  LATEX LINTING - ENHANCED ERROR DETECTION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Enhanced LaTeX support with chktex linting and detailed error reporting.
  
  Features:
  - Real-time LaTeX error detection with chktex
  - Integration with nvim-lint for on-save linting
  - Detailed error messages with suggestions
  - Quick access to error list
--]]

return {
  "mfussenegger/nvim-lint",
  opts = function(_, opts)
    local lint = require("lint")

    -- Add LaTeX linter if not already present
    if not lint.linters_by_ft.tex then
      lint.linters_by_ft.tex = { "chktex" }
    else
      table.insert(lint.linters_by_ft.tex, "chktex")
    end

    if not lint.linters_by_ft.latex then
      lint.linters_by_ft.latex = { "chktex" }
    else
      table.insert(lint.linters_by_ft.latex, "chktex")
    end

    -- Configure chktex linter with custom options
    if not lint.linters.chktex then
      lint.linters.chktex = {
        cmd = "chktex",
        stdin = false,
        args = {
          "-wall",        -- Enable all warnings
          "-n",           -- Quiet mode
          "-q",           -- Suppress warnings
          "-l",           -- Numeric output
        },
        stream = "stdout",
        ignore_exitcode = true,
        parser = function(output)
          local diagnostics = {}
          for line in output:gmatch("[^\n]+") do
            local col, lnum, msg = line:match("(%d+):(%d+): (%d+): (.-):  (.*)")
            if col and lnum and msg then
              table.insert(diagnostics, {
                lnum = tonumber(lnum) - 1,
                col = tonumber(col) - 1,
                message = msg,
                severity = vim.diagnostic.severity.WARN,
                source = "chktex",
              })
            end
          end
          return diagnostics
        end,
      }
    end

    return opts
  end,
  config = function(_, opts)
    local lint = require("lint")

    -- Setup autocmds for automatic linting on LaTeX files
    local group = vim.api.nvim_create_augroup("latex_lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
      group = group,
      pattern = { "*.tex", "*.latex" },
      callback = function()
        lint.try_lint("chktex")
      end,
    })

    -- Keybindings for LaTeX linting
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>lc", function()
      lint.try_lint("chktex")
    end, opts)

    -- Integration with diagnostics
    vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
  end,
}
