--[[
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  DIAGNOSTICS PANEL - TROUBLE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Trouble: Beautiful panel showing all errors, warnings, hints
  
  - Organized list of all diagnostics in project
  - Filter by severity (errors, warnings, info, hints)
  - Jump to error locations with single click
  - Preview code in context
  - Real-time updates as you code
--]]

return {
  "folke/trouble.nvim",
  cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup({
      position = "bottom",
      height = 10,
      width = 50,
      icons = true,
      mode = "document_diagnostics",
      grouping = "severity",
      padding = true,
      indent_lines = true,
      auto_open = false,
      auto_close = false,
      auto_preview = true,
      auto_fold = false,
      auto_jump = false,
      focus = false,
      restore = true,
      follow = true,
      multiline = true,
    })

    -- Keybindings
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<CR>", opts)
    vim.keymap.set("n", "<leader>tr", "<cmd>TroubleRefresh<CR>", opts)
    vim.keymap.set("n", "<leader>te", "<cmd>Trouble document_diagnostics<CR>", opts)
    vim.keymap.set("n", "<leader>tw", "<cmd>Trouble workspace_diagnostics<CR>", opts)
    vim.keymap.set("n", "<leader>tq", "<cmd>Trouble quickfix<CR>", opts)
    vim.keymap.set("n", "<leader>tl", "<cmd>Trouble loclist<CR>", opts)

    -- Navigate diagnostics
    vim.keymap.set("n", "]d", function()
      require("trouble").next({ skip_groups = true, jump = true })
    end, opts)

    vim.keymap.set("n", "[d", function()
      require("trouble").previous({ skip_groups = true, jump = true })
    end, opts)
  end,
}
