--[[
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  CONFORM - CODE FORMATTER
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Auto-formats on save. LaTeX excluded — formatting handled by vimtex.
--]]

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        tex = {},
      },
      format_on_save = function(bufnr)
        if vim.bo[bufnr].filetype == "tex" then return end
        return { timeout_ms = 1000, lsp_fallback = true }
      end,
    },
  },
}
