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
    require("gitsigns").setup({
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      signcolumn = true, -- Show signs in the margin
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = {
        follow_files = true,
      },
      attach_to_untracked = false,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false,
      },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      yadm = {
        enable = false,
      },
    })

    -- Keybindings for git operations
    local gs = require("gitsigns")
    local opts = { noremap = true, silent = true }

    -- Stage/unstage hunks
    vim.keymap.set("n", "<leader>gs", gs.stage_hunk, opts)
    vim.keymap.set("n", "<leader>gr", gs.reset_hunk, opts)
    vim.keymap.set("v", "<leader>gs", function()
      gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, opts)
    vim.keymap.set("v", "<leader>gr", function()
      gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, opts)

    -- Stage entire buffer
    vim.keymap.set("n", "<leader>gS", gs.stage_buffer, opts)
    vim.keymap.set("n", "<leader>gu", gs.undo_stage_hunk, opts)

    -- Reset entire buffer
    vim.keymap.set("n", "<leader>gR", gs.reset_buffer, opts)

    -- Preview changes
    vim.keymap.set("n", "<leader>gp", gs.preview_hunk, opts)

    -- Blame line
    vim.keymap.set("n", "<leader>gb", function()
      gs.blame_line({ full = false })
    end, opts)

    -- Diff against index/HEAD
    vim.keymap.set("n", "<leader>gd", gs.diffthis, opts)
    vim.keymap.set("n", "<leader>gD", function()
      gs.diff_this("~")
    end, opts)

    -- Toggle line blame
    vim.keymap.set("n", "<leader>gtb", gs.toggle_current_line_blame, opts)

    -- Toggle deleted lines visibility
    vim.keymap.set("n", "<leader>gtd", gs.toggle_deleted, opts)
  end,
}
