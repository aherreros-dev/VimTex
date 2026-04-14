--[[
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  VISUAL GIT DIFFS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  DiffView: Side-by-side git diffs and merge conflict resolution
  
  - View diffs between commits, branches, working directory
  - Seamless merge conflict resolution interface
  - Interactive rebase with visual feedback
  - Better than git diff in terminal or fugitive
  - Integrates with gitsigns for complete git workflow
--]]

return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("diffview").setup({
      diff_binaries = false,
      enhanced_diff_hl = true,
      use_icons = true,
    })

    -- Keybindings
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>gv", "<cmd>DiffviewOpen<CR>", opts)
    vim.keymap.set("n", "<leader>gc", "<cmd>DiffviewClose<CR>", opts)
  end,
}
