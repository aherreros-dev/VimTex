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
      enhanced_diff_hl = true, -- Use better syntax highlighting for diff
      git_cmd = { "git" },
      use_icons = true,
      icons = {
        folder_closed = "",
        folder_open = "",
      },
      signs = {
        fold_closed = "",
        fold_open = "",
        done = "✓",
      },
      view = {
        default = {
          layout = "diff2_horizontal",
          disable_diagnostics = true,
          winbar_info = true,
        },
        merge_tool = {
          layout = "diff3_horizontal",
          disable_diagnostics = true,
          winbar_info = true,
        },
        file_history = {
          layout = "diff2_horizontal",
          disable_diagnostics = true,
          winbar_info = true,
        },
      },
      file_panel = {
        listing_style = "tree",
        tree_options = {
          flatten_dirs = true,
          folder_statuses = "only_folded",
        },
        win_config = {
          position = "left",
          width = 35,
          win_opts = {},
        },
      },
      file_history_panel = {
        log_options = {
          git = {
            single_file = {
              diff_merges = "combined",
            },
            multi_file = {
              diff_merges = "first-parent",
            },
          },
        },
        win_config = {
          position = "bottom",
          height = 16,
          win_opts = {},
        },
      },
      default_args = {
        DiffviewOpen = {},
        DiffviewFileHistory = {},
      },
      hooks = {},
      keymaps = {
        disable_default_key_maps = false,
        view = {
          { "n", "gf", "<Cmd>norm! gF<CR>", {} },
          { "n", "<leader>e", "", {} },
        },
        file_panel = {
          { "n", "j", "move_to_next_entry", {} },
          { "n", "k", "move_to_prev_entry", {} },
          { "n", "<CR>", "select_entry", {} },
          { "n", "o", "select_entry", {} },
          { "n", "<2-LeftMouse>", "select_entry", {} },
          { "n", "-", "toggle_stage_entry", {} },
          { "n", "s", "toggle_stage_entry", {} },
          { "n", "X", "restore_entry", {} },
          { "n", "R", "refresh_files", {} },
          { "n", "L", "open_commit_log", {} },
          { "n", "P", "open_in_pager", {} },
          { "n", "zf", "create_fold", {} },
          { "n", "zd", "delete_fold", {} },
        },
        file_history_panel = {
          { "n", "g!", ":DiffviewFileHistory %<CR>", {} },
          { "n", "zf", "create_fold", {} },
          { "n", "zd", "delete_fold", {} },
        },
      },
    })

    -- Keybindings
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>gv", "<cmd>DiffviewOpen<CR>", opts)
    vim.keymap.set("n", "<leader>gfh", "<cmd>DiffviewFileHistory %<CR>", opts)
    vim.keymap.set("n", "<leader>gcc", "<cmd>DiffviewClose<CR>", opts)
  end,
}
