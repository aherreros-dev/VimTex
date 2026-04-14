--[[
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  GIT INTEGRATION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Shows git changes directly in the code margin:
  - Line additions/modifications/deletions shown as colored markers
  - Stage/unstage individual hunks without leaving the editor
  - Preview changes inline with diff view
  - Integrates seamlessly with your workflow
--]]

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local gitsigns = require("gitsigns")
    
    gitsigns.setup({
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      signcolumn = true,
      numhl = false,
      linehl = false,
      watch_gitdir = { follow_files = true },
      attach_to_untracked = false,
    })

    -- Keybindings
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk, opts)
    vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk, opts)
    vim.keymap.set("n", "<leader>gS", gitsigns.stage_buffer, opts)
    vim.keymap.set("n", "<leader>gR", gitsigns.reset_buffer, opts)
    vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, opts)
    vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, opts)
  end,
}
