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
  config = function()
    local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- Configure diagnostics display
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
        format = function(diagnostic)
          return string.format("%s - %s", diagnostic.message, diagnostic.source)
        end,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "solid",
        source = true,
        header = { "Diagnostics", "DiagnosticFloatingInfo" },
      },
    })

    -- Improved LSP hover
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "solid",
      max_width = 80,
    })

    -- Improved LSP signature help
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "solid",
    })

    -- Keybindings for diagnostics
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
  end,
}
