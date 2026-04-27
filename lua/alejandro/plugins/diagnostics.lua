--[[
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  IMPROVED DIAGNOSTICS RENDERING
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Improved diagnostics display with virtual text, underlines, and signs
  
  - Show errors/warnings inline with virtual text
  - Underline errors in different colors
  - Sign column with error indicators
  - Hover diagnostics for more info
  - Better visual feedback
--]]

return {
  "neovim/nvim-lspconfig",
  lazy = true,
  config = function()
    -- Define diagnostic signs with meaningful icons
    local signs = {
      Error = { text = "󰅚", texthl = "DiagnosticSignError" },
      Warn = { text = "󰀪", texthl = "DiagnosticSignWarn" },
      Hint = { text = "󰌶", texthl = "DiagnosticSignHint" },
      Info = { text = "", texthl = "DiagnosticSignInfo" },
    }

    for type, config in pairs(signs) do
      vim.fn.sign_define("Diagnostic" .. type, config)
    end

    -- GRUVBOX underline colors (desactivado)
    -- vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#fb4934" })
    -- vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn",  { undercurl = true, sp = "#fe8019" })
    -- vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint",  { undercurl = true, sp = "#83a598" })
    -- vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo",  { undercurl = true, sp = "#8ec07c" })

    -- AURA underline colors
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#ff6767" })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn",  { undercurl = true, sp = "#ffca85" })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint",  { undercurl = true, sp = "#a277ff" })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo",  { undercurl = true, sp = "#82e2ff" })

    -- Configure diagnostics display with enhanced virtual text
    vim.diagnostic.config({
      virtual_text = {
        prefix = "",
        format = function(diagnostic)
          local severity = vim.diagnostic.severity[diagnostic.severity]
          local message = diagnostic.message:match("^%s*(.-)%s*$")
          local source = diagnostic.source or "Unknown"
          return string.format("[%s] %s — %s", severity, message, source)
        end,
        spacing = 4,
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = signs.Error.text,
          [vim.diagnostic.severity.WARN] = signs.Warn.text,
          [vim.diagnostic.severity.HINT] = signs.Hint.text,
          [vim.diagnostic.severity.INFO] = signs.Info.text,
        },
        texthl = {
          [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
          [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
          [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
          [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
        },
      },
      underline = {
        severity = {
          min = vim.diagnostic.severity.HINT,
        },
      },
      update_in_insert = false,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = { "Diagnostics", "DiagnosticFloatingInfo" },
        max_width = 100,
      },
    })

    -- Custom namespace for better control
    local namespace = vim.api.nvim_create_namespace("diagnostics")

    -- Improved LSP hover
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
      max_width = 80,
    })

    -- Improved LSP signature help
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })

    -- Keybindings for diagnostics
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
  end,
}
